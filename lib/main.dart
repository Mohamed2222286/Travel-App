import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/app_data.dart';
import 'package:untitled3/screens/category_trips_screen.dart';
import 'package:untitled3/screens/tas_screen.dart';
import 'package:untitled3/screens/trip_details_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'models/trip.dart';
import 'screens/filters_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool > _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> _availableTrips = Trips_data;

  final List<Trip> _favoriteTrip =[];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where(
            (trip) {
          if (_filters['summer'] == true && trip.isInSummer != true) {
            return false;
          }
          if (_filters['winter'] == true && trip.isInWinter != true) {
            return false;
          }
          if (_filters['family'] == true && trip.isForFamilies != true) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex = _favoriteTrip.indexWhere(
          (trip) => trip.id == tripId,
    );
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrip.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrip.add(Trips_data.firstWhere(
              (trip) => trip.id == tripId,
        ));
      });
    }
  }

  bool _isfavorite(String id) {
    return _favoriteTrip.any((trip) => trip.id == id,);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // Arabic
      ],
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: ThemeData
            .light()
            .textTheme
            .copyWith(
          headlineMedium: GoogleFonts.elMessiri(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.elMessiri(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) =>
            TabsScreen(
              favoriteTrips: _favoriteTrip,
            ),
        // New Home Screen
        CategoryTripsScreen.screenRoute: (context) =>
            CategoryTripsScreen(
              avilableTrips: _availableTrips,
            ),
        TripDetailsScreen.screenRoute: (context) =>
            TripDetailsScreen(
              mangefavorite: _manageFavorite,isfavorite: _isfavorite, ),
        FiltersScreen.ScreenRoute: (context) =>
            FiltersScreen(
                currentFilters: _filters, saveFilters: _changeFilters),
      },
    );
  }
}

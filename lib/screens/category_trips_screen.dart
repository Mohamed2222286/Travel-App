import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/widgets/trip_item.dart';
import '../models/trip.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category_trips';
  final List<Trip> avilableTrips;

  const CategoryTripsScreen({super.key, required this.avilableTrips});

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryid = routeArgument['id'];
    categoryTitle = routeArgument['title']!;
    displayTrips = widget.avilableTrips.where(
      (trip) {
        return trip.categories.contains(categoryid);
      },
    ).toList();
    super.didChangeDependencies();
  }

  //  void _removeTrip(String tripid) {
  //   setState(() {
  //     displayTrips.removeWhere(
  //       (trip) => trip.id == tripid,
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
          );
        },
      ),
    );
  }
}

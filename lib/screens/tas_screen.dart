import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/screens/categories_screen.dart';
import 'package:untitled3/screens/favorite_screen.dart';
import '../models/trip.dart';
import '../widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key, required this.favoriteTrips});
  final List <Trip> favoriteTrips ;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;
  List<Map<String, dynamic>>? _screens ;

  @override
  void initState() {
    _screens= [
      // Key Type Always Equal String And Value Type Always Equal Dynamic TO accepted any Type Of Value
      {
        'Screen': const CatigoriesScreen(),
        'Title': 'تصنيفات الرحلات ',
      },
      {
        'Screen': FavoriteScreen(favoriteTrips: widget.favoriteTrips,),
        'Title': ' الرحلات المفضلة ',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          _screens![_selectedScreenIndex]['Title'],
          style: GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _screens![_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 7,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        selectedLabelStyle: GoogleFonts.elMessiri(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: GoogleFonts.elMessiri(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            label: 'التصنيفات',
            icon: Icon(
              Icons.dashboard,
              // color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'المفضلة',
            icon: Icon(
              Icons.favorite,
              // color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

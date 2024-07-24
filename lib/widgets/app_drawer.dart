import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget buildListTile(
      {required String title, required IconData icon,  required dynamic fun}) {
    return ListTile(
      onTap:  fun ,
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: GoogleFonts.elMessiri(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            alignment: Alignment.bottomCenter,
            height: 100,
            width: double.infinity,
            child: Text(
              'دليلك السياحي',
              style: GoogleFonts.elMessiri(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            title: 'الرحلات',
            icon: Icons.card_travel,
            fun: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buildListTile(
            title: 'الفلترة',
            icon: Icons.filter_list,
            fun: () =>
                Navigator.of(context).pushReplacementNamed(FiltersScreen.ScreenRoute),
          ),
        ],
      ),
    );
  }
}

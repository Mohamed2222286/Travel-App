import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.favoriteTrips});

  final List<Trip> favoriteTrips;

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(
        child: Text(
          'ليس لديك أي رحلات في قائمة المفضلة ',
          style: GoogleFonts.elMessiri(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,
          );
        },
      );
    }
  }
}

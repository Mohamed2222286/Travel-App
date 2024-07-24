import 'package:flutter/material.dart';
import 'package:untitled3/models/trip.dart';
import 'package:untitled3/screens/trip_details_screen.dart';

class TripItem extends StatelessWidget {
  final String id;

  final String title;

  final String imageUrl;

  final int duration;

  final TripType tripType;

  final Season season;

  const TripItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
  });

  void selectedTrip(BuildContext context) {
    Navigator.of(context).pushNamed(
      TripDetailsScreen.screenRoute,
      arguments: id,
    );
  }

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Autum:
        return 'خريف';
        break;
      default:
        return 'غير معروف';
        break;
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Activities:
        return 'أنشطة';
        break;
      case TripType.Therapy:
        return 'معالجة';
        break;
      default:
        return 'غير معروف';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  height: 250,
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8),
                        ],
                        stops: const [
                          0.6,
                          1
                        ]),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.today,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '$duration أيام ',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        seasonText,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.family_restroom,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        tripTypeText,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

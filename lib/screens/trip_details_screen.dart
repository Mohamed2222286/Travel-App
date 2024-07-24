import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/app_data.dart';

class TripDetailsScreen extends StatelessWidget {
  static const screenRoute = '/trip_detail';
  final dynamic mangefavorite;
  final Function isfavorite;

  const TripDetailsScreen(
      {super.key, required this.mangefavorite, required this.isfavorite});

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: GoogleFonts.elMessiri(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripid = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => tripid == trip.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedTrip.title,
          style: GoogleFonts.elMessiri(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, "الأنشطة"),
            buildListViewContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        selectedTrip.activities[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedTrip.activities.length,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colors.blue,
                          child: Text(
                            ' يوم ${index + 1}  ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          selectedTrip.program[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
                itemCount: selectedTrip.program.length,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
        onPressed: () => mangefavorite(tripid),
        child: Icon(
          isfavorite(tripid) ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
    );
  }
}

IconData icontype(bool isfavorite) {
  if (isfavorite == true) {
    return Icons.favorite;
  } else {
    return Icons.favorite_border;
  }
}

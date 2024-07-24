import 'package:flutter/material.dart';
import 'package:untitled3/widgets/category_item.dart';
import 'package:untitled3/app_data.dart';

class CatigoriesScreen extends StatelessWidget {
  const CatigoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'دليل سياحي',
      //     style: GoogleFonts.elMessiri(
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: Catigories_data.map(
          (e) => CategoryItem(
            title: e.title,
            imageUrl: e.imageUrl,
            id: e.id,
          ),
        ).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {super.key, required this.saveFilters, required this.currentFilters});

  static const ScreenRoute = '/fillters';
  final dynamic saveFilters;

  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _summer = false;

  bool _winter = false;

  bool _family = false;

  @override
  void initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;
    super.initState();
  }

  Widget buildSwatchListTile(
      {required String title,
      required String subTitle,
      required bool value,
      required dynamic updatevalue}) {
    return SwitchListTile(
        title: Text(
          title,
          style: GoogleFonts.elMessiri(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: GoogleFonts.elMessiri(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        value: value,
        onChanged: updatevalue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          'الفلترة',
          style: GoogleFonts.elMessiri(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildSwatchListTile(
                  title: 'الرحلات الصيفية',
                  subTitle: 'اظهار الرحلات في فصل الصيف فقط ',
                  value: _summer,
                  updatevalue: (newvalue) => setState(() {
                    _summer = newvalue;
                  }),
                ),
                buildSwatchListTile(
                  title: 'الرحلات الشتوية',
                  subTitle: 'اظهار الرحلات في فصل الشتاء فقط ',
                  value: _winter,
                  updatevalue: (newvalue) => setState(() {
                    _winter = newvalue;
                  }),
                ),
                buildSwatchListTile(
                  title: 'الرحلات العائلية',
                  subTitle: 'اظهار الرحلات العائلية فقط ',
                  value: _family,
                  updatevalue: (newvalue) => setState(() {
                    _family = newvalue;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

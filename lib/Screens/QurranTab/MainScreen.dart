import 'package:flutter/material.dart';
import 'package:quran/Core/Assets/ImagesAssets.dart';
import 'package:quran/Core/HelperWidgets/main_bg_widget.dart';
import 'package:quran/Screens/QurranTab/Widgets/MostRecent.dart';
import 'package:quran/Screens/QurranTab/Widgets/QuranList.dart';
import 'package:quran/Screens/QurranTab/Widgets/TextFormField.dart';

class Qurantab extends StatefulWidget {
  const Qurantab({super.key});

  @override
  State<Qurantab> createState() => _QurantabState();
}

class _QurantabState extends State<Qurantab> {
  @override
  TextEditingController QuranSurraSearch = new TextEditingController();
  String Searchoutput = "";
  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: Imagesassets.HomeScreenImage,
      child: Expanded(
        child: Column(
          children: [
            TextForm(QuranSurraSearch, (val) {
              Searchoutput = val;
              setState(() {});
            }),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MostRecentView(),
                    Quranlist(Searchoutput: Searchoutput),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

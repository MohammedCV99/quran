import 'package:flutter/material.dart';
import 'package:quran/Core/Assets/ImagesAssets.dart';
import 'package:quran/Core/Colors/AppColors.dart';
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
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Imagesassets.HomeScreenImage),
            fit: BoxFit.fill,
            opacity: 0.6,
          ),
          gradient: LinearGradient(
            colors: [
              AppColors.blackColor.withValues(alpha: .7),
              AppColors.blackColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Expanded(
            child: Column(
              children: [
                SizedBox(height: 20),
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
        ),
      ),
    );
  }
}

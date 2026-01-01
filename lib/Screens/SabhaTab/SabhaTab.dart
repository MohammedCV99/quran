import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quran/Core/Assets/AppKeys.dart';
import 'package:quran/Core/Assets/ConstAssets.dart';
import 'package:quran/Core/Assets/ImagesAssets.dart';
import 'package:quran/Core/Colors/AppColors.dart';
import 'package:quran/Core/HelperWidgets/main_bg_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sabhatab extends StatefulWidget {
  const Sabhatab({super.key});

  @override
  State<Sabhatab> createState() => _SabhatabState();
}

class _SabhatabState extends State<Sabhatab> {
  @override
  int count = 0;
  String SebhaText = "سبحان الله";

  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: Imagesassets.SabhaBG,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: TextStyle(
                color: AppColors.offWhiteColor,
                fontFamily: AppConsts.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Imagesassets.SabihaLogo),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Text(
                    SebhaText,
                    style: TextStyle(
                      color: AppColors.offWhiteColor,
                      fontFamily: AppConsts.fontFamily,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    count.toString(),
                    style: TextStyle(
                      color: AppColors.offWhiteColor,
                      fontFamily: AppConsts.fontFamily,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              count++;
              setState(() {
                if (count >= 1 && count <= 33) {
                  SebhaText = "سبحان الله";
                  print("سبحه: $count");
                } else if (count >= 34 && count <= 66) {
                  SebhaText = "الحمد لله";
                } else if (count >= 67 && count <= 99) {
                  SebhaText = "الله أكبر";
                } else if (count == 100) {
                  SebhaText = "لا إله إلا الله";
                } else if (count > 100) {
                  count = 1;
                  SebhaText = "سبحان الله";
                }
              });
            },
          ),
        ],
      ),
    );
  }

  //********************* For future uses **********************
  Future SaveCount(int count) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(Appkeys.countKey, count);
  }

  Future getCount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    count = pref.getInt(Appkeys.countKey)!;
  }
}

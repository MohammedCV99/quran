import 'package:flutter/material.dart';
import 'package:quran/Core/Assets/ConstAssets.dart';
import 'package:quran/Core/Assets/ImagesAssets.dart';
import 'package:quran/Core/Colors/AppColors.dart';

class Qurandetials extends StatelessWidget {
  static const String routeName = 'QuranDetials';

  const Qurandetials({
    super.key,
    required this.SuraAyat,
    required this.SuraName,
  });
  final String SuraAyat;
  final String SuraName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Imagesassets.QuranDetailsBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              Center(
                child: Text(
                  SuraName,
                  style: TextStyle(
                    color: AppColors.goldColor,
                    fontFamily: AppConsts.fontFamily,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment(0, 0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      SuraAyat,
                      style: TextStyle(
                        color: AppColors.goldColor,
                        fontFamily: AppConsts.fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

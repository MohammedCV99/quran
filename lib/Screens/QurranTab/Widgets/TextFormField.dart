import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/Core/Assets/ConstAssets.dart';
import 'package:quran/Core/Assets/SVGAssets.dart';
import 'package:quran/Core/Colors/AppColors.dart';

Widget TextForm(TextEditingController Controller, ValueChanged fun) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        onChanged: fun,
        style: TextStyle(color: AppColors.offWhiteColor),
        decoration: InputDecoration(
          fillColor: AppColors.TextFormFillColor,
          hintText: "Sura Name",
          hintStyle: TextStyle(
            fontFamily: AppConsts.fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.WhiteSecondLevel,
          ),

          suffixIcon: Padding(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              Svgassets.quranIcon,
              colorFilter: ColorFilter.mode(
                AppColors.goldColor,
                BlendMode.color,
              ),
              width: 20,
              height: 20,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.goldColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.goldColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.goldColor, width: 1),
          ),
        ),
        textInputAction: TextInputAction.next,
        controller: Controller,
      ),
    ),
  );
}

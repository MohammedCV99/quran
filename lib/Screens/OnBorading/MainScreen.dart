// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quran/Core/AppData/OnboardingData/OnboardingData.dart';
import 'package:quran/Core/Assets/ConstAssets.dart';

import 'package:quran/Core/Colors/AppColors.dart';
import 'package:quran/Core/HelperWidgets/Main_Header.dart';

class OnBoradingMainScreen extends StatelessWidget {
  final String IMGpath;
  final String MainLine;
  final String SubTitle;
  final void Function()? NextFun;
  final void Function()? BackFun;
  final void Function()? FinishFun;

  final int currentpage;
  const OnBoradingMainScreen({
    Key? key,
    required this.IMGpath,
    required this.MainLine,
    required this.SubTitle,
    required this.NextFun,
    required this.currentpage,
    this.BackFun,
    this.FinishFun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          MainHeader(),
          Image.asset(IMGpath, height: 400),
          SizedBox(height: 10),
          Text(
            MainLine,
            style: TextStyle(
              color: AppColors.goldColor,
              fontWeight: FontWeight.w700,
              fontFamily: AppConsts.fontFamily,
              fontSize: 24,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.all(10),
            child: Text(
              SubTitle,
              style: TextStyle(
                color: AppColors.goldColor,
                fontWeight: FontWeight.w700,
                fontFamily: AppConsts.fontFamily,
                fontSize: 14,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: BackFun,
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.amber),
                ),
              ),

              // Page Indicator
              Row(
                children: List.generate(5, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentpage == index ? Colors.amber : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),

              currentpage != OnBoradingData.length - 1
                  ? TextButton(
                    onPressed: NextFun,
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.amber),
                    ),
                  )
                  : TextButton(
                    onPressed: FinishFun,
                    child: const Text(
                      "Finish",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

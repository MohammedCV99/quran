import 'package:flutter/material.dart';
import 'package:quran/Core/AppData/OnboardingData/OnboardingData.dart';
import 'package:quran/Core/Assets/AppKeys.dart';
import 'package:quran/Screens/MainLayer.dart';
import 'package:quran/Screens/OnBorading/MainScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onborading extends StatefulWidget {
  const Onborading({super.key});

  @override
  State<Onborading> createState() => _OnboradingState();
}

class _OnboradingState extends State<Onborading> {
  final PageController _pageController = PageController();
  bool FinishOnboarding = false;
  int _activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            _activePage = value;
          });
        },
        controller: _pageController,
        itemBuilder: (context, index) {
          return OnBoradingMainScreen(
            IMGpath: OnBoradingData[index].IMGpath,
            MainLine: OnBoradingData[index].Title,
            SubTitle: OnBoradingData[index].SubTitle,
            NextFun: onNextPage,
            currentpage: _activePage,
            BackFun: onpreviousPage,
            FinishFun: FinishFuncation,
          );
        },
        itemCount: OnBoradingData.length,
      ),
    );
  }

  void onNextPage() {
    if (_activePage < OnBoradingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  void onpreviousPage() {
    if (_activePage > -1) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  Future FinishFuncation() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setBool(Appkeys.FinishKey, true);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) {
          return MainLayer();
        },
      ),
    );
  }
}

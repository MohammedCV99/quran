import 'package:flutter/material.dart';
import 'package:quran/Core/Assets/AppKeys.dart';
import 'package:quran/Screens/MainLayer.dart';
import 'package:quran/Screens/OnBorading/OnBorading.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: Main(), debugShowCheckedModeBanner: false));
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  bool FinishOnboarding = false;
  void initState() {
    // TODO: implement initState
    FinishOnBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FinishOnboarding ? MainLayer() : Onborading();
  }

  Future FinishOnBoarding() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool True_False = pref.getBool(Appkeys.FinishKey) ?? false;
    setState(() {
      FinishOnboarding = True_False;
    });
  }
}

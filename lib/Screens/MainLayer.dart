import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/Core/Assets/SVGAssets.dart';
import 'package:quran/Core/Colors/AppColors.dart';
import 'package:quran/Core/HelperWidgets/common_decorations.dart';
import 'package:quran/Screens/HadeethTab/MainScreen.dart';
import 'package:quran/Screens/QurranTab/MainScreen.dart';
import 'package:quran/Screens/RadioTab/RadioTab.dart';
import 'package:quran/Screens/SabhaTab/SabhaTab.dart';

class MainLayer extends StatefulWidget {
  static const String routeName = 'mainLayer';

  const MainLayer({super.key});

  @override
  State<MainLayer> createState() => _MainLayerState();
}

class _MainLayerState extends State<MainLayer> {
  int currentTab = 0;
  List<Widget> tabs = [
    Qurantab(),
    Sabhatab(),
    HadeethTab(),

    //  Radiotab(),
    //Container(color: Colors.pink),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: tabs[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed

        backgroundColor: AppColors.goldColor,

        fixedColor: AppColors.blackColor,
        currentIndex: currentTab,
        onTap: (value) {
          setState(() {
            currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration:
                  currentTab == 0
                      ? CommonDecorations.selectedItemDecoration
                      : null,
              child: SvgPicture.asset(
                Svgassets.quranIcon,
                width: currentTab == 0 ? 20 : 25,
                color: currentTab == 0 ? Colors.white : null,
              ),
            ),
            label: 'quran',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration:
                  currentTab == 1
                      ? CommonDecorations.selectedItemDecoration
                      : null,
              child: SvgPicture.asset(
                Svgassets.sebhaIcon,
                width: currentTab == 1 ? 20 : 25,
                color: currentTab == 1 ? Colors.white : null,
              ),
            ),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration:
                  currentTab == 2
                      ? CommonDecorations.selectedItemDecoration
                      : null,
              child: SvgPicture.asset(
                Svgassets.hadeethIcon,
                width: currentTab == 2 ? 20 : 25,
                color: currentTab == 2 ? Colors.white : null,
              ),
            ),
            label: 'Hadeeth',
          ),

          /*       BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration:
                  currentTab == 3
                      ? CommonDecorations.selectedItemDecoration
                      : null,
              child: SvgPicture.asset(
                Svgassets.radioIcon,
                width: currentTab == 3 ? 20 : 25,
                color: currentTab == 3 ? Colors.white : null,
              ),
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration:
                  currentTab == 4
                      ? CommonDecorations.selectedItemDecoration
                      : null,
              child: SvgPicture.asset(
                Svgassets.timesIcon,
                width: currentTab == 4 ? 20 : 25,
                color: currentTab == 4 ? Colors.white : null,
              ),
            ),
            label: 'Time',
          ),
          */
        ],
      ),
    );
  }
}

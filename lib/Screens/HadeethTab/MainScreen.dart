import 'package:flutter/material.dart';
import 'package:quran/Core/AppData/Hadeeth/HadeethData.dart';
import 'package:quran/Core/Assets/ImagesAssets.dart';
import 'package:quran/Core/Colors/AppColors.dart';
import 'package:quran/Core/HelperWidgets/main_bg_widget.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );
  int currantPAge = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      if ((controller.page ?? 0).toInt() != currantPAge) {
        setState(() {
          currantPAge = (controller.page ?? 0).toInt();
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: Imagesassets.Hadeethbg,
      child: Expanded(
        child: PageView.builder(
          controller: controller,
          itemCount: HadeethList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: index != currantPAge ? 40.0 : 20.0,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                padding: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.goldColor,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(Imagesassets.hadeeth_card, fit: BoxFit.fill),
                    Column(
                      children: [
                        SizedBox(height: 42),
                        Text(
                          HadeethList[index].HadeethNumber,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),

                            child: Text(
                              HadeethList[index].Hadeeth,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

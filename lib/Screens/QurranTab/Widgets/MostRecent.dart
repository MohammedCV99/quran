import 'package:flutter/material.dart';
import 'package:quran/Core/AppData/Quran/QuranData.dart';
import 'package:quran/Core/AppData/Quran/QuranModel.dart';
import 'package:quran/Core/Assets/AppKeys.dart';
import 'package:quran/Core/Assets/ImagesAssets.dart';
import 'package:quran/Core/Colors/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentView extends StatefulWidget {
  const MostRecentView({super.key});

  @override
  State<MostRecentView> createState() => _MostRecentViewState();
}

class _MostRecentViewState extends State<MostRecentView> {
  List<Quran> mostRecent = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMostRicent();
  }

  @override
  void didUpdateWidget(covariant MostRecentView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    loadMostRicent();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Most Recently',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        //    SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 280,
                child: Card(
                  color: AppColors.goldColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 7,
                      bottom: 7,
                      right: 7,
                      left: 20,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  mostRecent[index].EnName,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Text(
                                mostRecent[index].ArName,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${mostRecent[index].AyaNumber} Verses',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Image.asset(Imagesassets.suraCard),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: mostRecent.length,
          ),
        ),
      ],
    );
  }

  loadMostRicent() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> data = pref.getStringList(Appkeys.MostRecentKey) ?? [];
    List<Quran> suras = [];
    print('--->${data}');
    for (int i = 0; i < data.length; i++) {
      suras.add(
        Quran(
          quranList[int.parse(data[i])].Index,
          quranList[int.parse(data[i])].Venus,
          quranList[int.parse(data[i])].ArName,
          quranList[int.parse(data[i])].EnName,
          quranList[int.parse(data[i])].AyaNumber,
        ),
      );
    }
    setState(() {
      mostRecent = suras.reversed.toList();
    });
  }
}

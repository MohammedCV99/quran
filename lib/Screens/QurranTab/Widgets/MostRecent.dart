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
  late Future<List<Quran>> _mostRecentFuture;

  @override
  void initState() {
    super.initState();
    _mostRecentFuture = _loadMostRecent();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ===== TITLE =====
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Most Recently',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),

        // ===== LIST =====
        SizedBox(
          height: 150,
          child: FutureBuilder<List<Quran>>(
            future: _mostRecentFuture,
            builder: (context, snapshot) {
              // Loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              // Empty state
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    'No recent Surahs',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              final mostRecent = snapshot.data!;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                itemCount: mostRecent.length,
                itemBuilder: (context, index) {
                  final sura = mostRecent[index];

                  return SizedBox(
                    width: 280,
                    child: Card(
                      color: AppColors.goldColor,
                      margin: const EdgeInsets.only(right: 12),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 7,
                          bottom: 7,
                          right: 7,
                          left: 20,
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    sura.EnName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  sura.ArName,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${sura.AyaNumber} Verses',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
              );
            },
          ),
        ),
      ],
    );
  }

  // ===== LOAD MOST RECENT =====
  Future<List<Quran>> _loadMostRecent() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(Appkeys.MostRecentKey) ?? [];

    List<Quran> suras = [];

    for (var value in data) {
      final index = int.parse(value);
      suras.add(
        Quran(
          quranList[index].Index,
          quranList[index].Venus,
          quranList[index].ArName,
          quranList[index].EnName,
          quranList[index].AyaNumber,
        ),
      );
    }

    // Latest first
    return suras.reversed.toList();
  }
}

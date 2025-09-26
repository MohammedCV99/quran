import 'package:flutter/material.dart';
import 'package:quran/Core/AppData/Quran/QuranData.dart';
import 'package:quran/Core/AppData/Quran/QuranModel.dart';
import 'package:quran/Core/Assets/AppKeys.dart';
import 'package:quran/Core/Colors/AppColors.dart';
import 'package:quran/Screens/QurranTab/Widgets/QuranDetials.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Quranlist extends StatefulWidget {
  const Quranlist({super.key, required this.Searchoutput});
  final String Searchoutput;
  @override
  State<Quranlist> createState() => _QuranlistState();
}

class _QuranlistState extends State<Quranlist> {
  @override
  Widget build(BuildContext context) {
    List<Quran> suras =
        quranList
            .where(
              (element) =>
                  element.ArName.contains(widget.Searchoutput) ||
                  element.EnName.toLowerCase().contains(
                    widget.Searchoutput.toLowerCase(),
                  ),
            )
            .toList();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Suras list',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  cashSuraToList(suras[index].Index - 1).then((value) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (Builder) {
                          return Qurandetials(
                            SuraAyat: suras[index].Venus,
                            SuraName: suras[index].ArName,
                          );
                        },
                      ),
                    );
                  });
                },
                title: Text(
                  suras[index].EnName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  '${suras[index].AyaNumber} Verses',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                trailing: Text(
                  suras[index].ArName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                leading: Stack(
                  alignment: Alignment(0, 0),
                  children: [
                    Icon(Icons.brightness_5, size: 45, color: Colors.white),
                    Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        fontSize:
                            (index + 1) > 99
                                ? 8
                                : (index * 10) > 9
                                ? 14
                                : 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                endIndent: 65,
                indent: 65,
                color: AppColors.goldColor,
              );
            },
            itemCount: suras.length,
          ),
        ],
      ),
    );
  }

  Future cashSuraToList(int index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> data = pref.getStringList(Appkeys.MostRecentKey) ?? [];
    setState(() {
      Set<String> temp = data.toSet();
      data = temp.toList();
      data.remove(index.toString());
      data.add(index.toString());
      pref.setStringList(Appkeys.MostRecentKey, data);
    });
  }
}

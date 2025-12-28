import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/Core/AppData/Quran/Records/RecordData.dart';
import 'package:quran/Core/Assets/ConstAssets.dart';
import 'package:quran/Core/Assets/ImagesAssets.dart';
import 'package:quran/Core/Colors/AppColors.dart';
import 'package:quran/Screens/QurranTab/Widgets/RecordPage.dart';
import 'package:share_plus/share_plus.dart';

class Qurandetials extends StatefulWidget {
  static const String routeName = 'QuranDetials';

  const Qurandetials({
    super.key,
    required this.index,
    required this.SuraAyat,
    required this.SuraName,
  });

  final int index;
  final String SuraAyat;
  final String SuraName;

  @override
  State<Qurandetials> createState() => _QurandetialsState();
}

class _QurandetialsState extends State<Qurandetials> {
  final ScrollController _scrollController = ScrollController();

  bool _autoScroll = false;
  bool _showFab = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  // ================= AUTO SCROLL =================
  void _startAutoScroll() async {
    await Future.delayed(const Duration(seconds: 1));

    while (_autoScroll &&
        mounted &&
        _scrollController.hasClients &&
        _scrollController.offset < _scrollController.position.maxScrollExtent) {
      await _scrollController.animateTo(
        _scrollController.offset + 30,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.linear,
      );
    }
  }

  // ================= SCROLL LISTENER =================
  void _scrollListener() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    if (currentScroll >= maxScroll - 10) {
      if (_showFab) {
        setState(() {
          _showFab = false;
          _autoScroll = false;
        });
      }
    } else {
      if (!_showFab) {
        setState(() {
          _showFab = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _autoScroll = false;
    _scrollController.dispose();
    super.dispose();
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.goldColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.record_voice_over, color: AppColors.goldColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => Recordpage(
                        SuraName: widget.SuraName,
                        Ayat: RecordList[widget.index].Ayat,
                        Audio: RecordList[widget.index].AyatRecords,
                      ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.share, color: AppColors.goldColor),
            onPressed: () async {
              await sharePdfFromAssets(widget.index);
            },
          ),
        ],
      ),

      body: Container(
        color: AppColors.blackColor,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(height: 10),

              // ===== SURAH NAME HEADER =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Imagesassets.Left_Sura_Name, width: 45),
                  Text(
                    widget.SuraName,
                    style: TextStyle(
                      color: AppColors.goldColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(Imagesassets.Right_Sura_Name, width: 45),
                ],
              ),

              const SizedBox(height: 40),

              // ===== AYAT TEXT =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    widget.SuraAyat,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.goldColor,
                      fontFamily: AppConsts.fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 2.2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),

      // ===== FLOATING ACTION BUTTON =====
      floatingActionButton: Visibility(
        visible: _showFab,
        child: FloatingActionButton(
          backgroundColor: AppColors.goldColor,
          onPressed: () {
            setState(() {
              _autoScroll = !_autoScroll;
              if (_autoScroll) _startAutoScroll();
            });
          },
          child: Icon(
            _autoScroll ? Icons.pause : Icons.play_arrow,
            color: AppColors.blackColor,
          ),
        ),
      ),
    );
  }

  // ================= SHARE PDF =================
  Future<void> sharePdfFromAssets(int index) async {
    final byteData = await rootBundle.load(
      'Assets/PDF/Surra (${index + 1}).pdf',
    );

    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/surah_${index + 1}.pdf');

    await file.writeAsBytes(byteData.buffer.asUint8List());

    await Share.shareXFiles([
      XFile(file.path),
    ], text: '📖 سورة من القرآن الكريم');
  }
}

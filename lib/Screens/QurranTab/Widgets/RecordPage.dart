import 'package:flutter/material.dart';
import 'package:quran/Core/Assets/ImagesAssets.dart';
import 'package:quran/Core/Colors/AppColors.dart';
import 'package:audioplayers/audioplayers.dart';

class Recordpage extends StatefulWidget {
  const Recordpage({
    super.key,
    required this.Ayat,
    required this.Audio,
    required this.SuraName,
  });

  final List Ayat;
  final List Audio;
  final String SuraName;

  @override
  State<Recordpage> createState() => _RecordpageState();
}

class _RecordpageState extends State<Recordpage> {
  late AudioPlayer _player;

  int? _currentPlayingIndex; // ⭐ highlighted ayah index

  @override
  void initState() {
    super.initState();

    _player = AudioPlayer();

    // 🔁 When audio finishes → play next ayah automatically
    _player.onPlayerComplete.listen((event) {
      if (_currentPlayingIndex == null) return;

      final nextIndex = _currentPlayingIndex! + 1;

      if (nextIndex < widget.Audio.length) {
        _playAudio(nextIndex);
      } else {
        // End of Surah
        setState(() {
          _currentPlayingIndex = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _playAudio(int index) async {
    await _player.stop();

    setState(() {
      _currentPlayingIndex = index;
    });

    await _player.play(UrlSource(widget.Audio[index]));
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
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          children: [
            const SizedBox(height: 10),

            // ===== SURAH NAME =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.SuraName,
                  style: TextStyle(
                    color: AppColors.goldColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColors.goldColor.withOpacity(0.4),
              thickness: 1.5,
              indent: 20,
              endIndent: 20,
            ),

            const SizedBox(height: 10),

            // ===== AYAT LIST =====
            Expanded(
              child: ListView.builder(
                itemCount: widget.Ayat.length,
                itemBuilder: (context, index) {
                  final isPlaying = index == _currentPlayingIndex;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
                    ),
                    child: InkWell(
                      onTap: () => _playAudio(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              isPlaying
                                  ? AppColors.goldColor.withOpacity(0.15)
                                  : Colors.transparent,
                          border: Border.all(
                            color:
                                isPlaying
                                    ? AppColors.goldColor
                                    : AppColors.goldColor.withOpacity(0.4),
                            width: isPlaying ? 2.5 : 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '${index + 1} - ${widget.Ayat[index]}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.goldColor,
                              fontSize: 16,
                              fontWeight:
                                  isPlaying
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

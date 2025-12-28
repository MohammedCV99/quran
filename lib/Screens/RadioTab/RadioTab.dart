import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran/Core/AppData/Quran/Radio/RadioData.dart';
import 'package:quran/Core/Assets/ImagesAssets.dart';
import 'package:quran/Core/Colors/AppColors.dart';
import 'package:quran/Core/HelperWidgets/main_bg_widget.dart';

class Radiotab extends StatefulWidget {
  const Radiotab({super.key});

  @override
  State<Radiotab> createState() => _RadiotabState();
}

class _RadiotabState extends State<Radiotab> {
  late AudioPlayer _player; // One shared player

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer(); // Initialize once
  }

  @override
  void dispose() {
    _player.dispose(); // Clean up when page is closed
    super.dispose();
  }

  bool play = false;
  Future<void> _playAudio(String url) async {
    await _player.play(UrlSource(url)); // Start new one
  }

  Future<void> _StopAudio() async {
    await _player.stop(); // Stop any currently playing audio
  }

  bool isMuted = false;
  void toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
    _player.setVolume(isMuted ? 0 : 1);
  }

  @override
  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: Imagesassets.HomeScreenImage,
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 135,
                      decoration: BoxDecoration(
                        color: AppColors.goldColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(RadioList[index].name),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon:
                                    !RadioList[index].PLAY
                                        ? Icon(Icons.play_arrow)
                                        : Icon(Icons.pause),
                                onPressed: () {
                                  if (!RadioList[index].PLAY) {
                                    setState(() {
                                      _playAudio(RadioList[index].url);
                                      RadioList[index].PLAY =
                                          !RadioList[index].PLAY;
                                    });
                                  } else {
                                    setState(() {
                                      _StopAudio();
                                      RadioList[index].PLAY =
                                          !RadioList[index].PLAY;
                                    });
                                  }
                                },
                              ),
                              IconButton(
                                icon:
                                    RadioList[index].MUTE
                                        ? Icon(Icons.volume_mute)
                                        : Icon(Icons.volume_up_outlined),
                                onPressed: () {
                                  if (!RadioList[index].MUTE) {
                                    setState(() {
                                      _player.setVolume(0);
                                      RadioList[index].MUTE =
                                          !RadioList[index].MUTE;
                                    });
                                  } else {
                                    setState(() {
                                      _player.setVolume(1);
                                      RadioList[index].MUTE =
                                          !RadioList[index].MUTE;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8);
                },
                itemCount: RadioList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

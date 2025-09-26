import 'package:flutter/material.dart';
import 'package:quran/Core/Assets/ImagesAssets.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Image.asset(
        Imagesassets.MainLogo,
        width: 300,
        height: 140,
        fit: BoxFit.cover,
      ),
    );
  }
}

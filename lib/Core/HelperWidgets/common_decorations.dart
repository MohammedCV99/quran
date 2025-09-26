import 'package:flutter/material.dart';
import 'package:quran/Core/Colors/AppColors.dart';

class CommonDecorations {
  static BoxDecoration selectedItemDecoration = BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(66)),
    color: AppColors.blackColor.withValues(alpha: .6),
  );
}

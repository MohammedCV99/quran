import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:quran/Core/Colors/AppColors.dart';
import 'package:quran/Screens/Qablia/loading_indicator.dart';
import 'package:quran/Screens/Qablia/qiblah_compass.dart';
import 'package:quran/Screens/Qablia/qiblah_maps.dart';

class QablaScreen extends StatefulWidget {
  const QablaScreen({super.key});

  @override
  State<QablaScreen> createState() => _QablaScreenState();
}

class _QablaScreenState extends State<QablaScreen> {
  final Future<bool?> _deviceSupport =
      FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      // ===== APP BAR =====
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Qiblah Direction',
          style: TextStyle(
            color: AppColors.goldColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.goldColor),
      ),

      // ===== BODY =====
      body: FutureBuilder<bool?>(
        future: _deviceSupport,
        builder: (context, snapshot) {
          // ⏳ Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: LoadingIndicator());
          }

          // ❌ Error
          if (snapshot.hasError) {
            return _ErrorView(message: snapshot.error.toString());
          }

          if (snapshot.data == true) {
            return _ContentWrapper(child: QiblahCompass());
          }

          return _ContentWrapper(child: QiblahMaps());
        },
      ),
    );
  }
}

class _ContentWrapper extends StatelessWidget {
  final Widget child;

  const _ContentWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.goldColor.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Align Yourself Toward Qiblah',
              style: TextStyle(
                color: AppColors.goldColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Please keep your phone flat',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColors.goldColor,
              size: 60,
            ),
            const SizedBox(height: 16),
            const Text(
              'Sensor Error',
              style: TextStyle(
                color: AppColors.goldColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart'; // ← CAMBIO ❗❗❗

import 'components/app_navigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // ← CAMBIO ❗❗❗
      title: 'Terapi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFFA726),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFA726)),
        useMaterial3: true,
      ),
      home: const AppNavigation(),
    );
  }
}

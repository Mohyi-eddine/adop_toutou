import 'package:adopttoutou/providers/loved_toutou_provider.dart';
import 'package:adopttoutou/screens/welcome_screen.dart';
import 'package:adopttoutou/theme/app_colors.dart';
import 'package:adopttoutou/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LovedToutouProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      title: 'Adopttoutou',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.playfulOrange),
        scaffoldBackgroundColor: AppColors.beige,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.playfulOrange,
          foregroundColor: AppColors.white,
          titleTextStyle: AppTextStyles.appTitle,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.playfulOrange,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 8,
            shadowColor: AppColors.playfulOrange.withOpacity(0.4),
            textStyle: AppTextStyles.button,
          ),
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

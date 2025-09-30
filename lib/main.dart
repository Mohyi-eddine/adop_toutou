import 'package:adopttoutou/providers/loved_toutou_provider.dart';
import 'package:adopttoutou/screens/list_toutou_screen.dart';
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
            textStyle: AppTextStyles.buttonText,
          ),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListToutouScreen()),
            );
          },
          child: const Text(
            "🐾 Join the Toutou World 🐾",
          ),
        ),
      ),
    );
  }
}

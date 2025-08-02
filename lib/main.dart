import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // <- Lottie import
import 'package:my_portfolio/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData get customTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A1F),
        primaryColor: const Color(0xFF3ABEFF),
        hintColor: const Color(0xFF00C2D1),
        cardColor: const Color(0xFF1C1C2A),
        dividerColor: Colors.white24,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(color: Color(0xFFF5F5F5), fontSize: 16),
          bodyMedium: TextStyle(color: Color(0xFFB0B0B0), fontSize: 14),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3ABEFF),
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF3ABEFF),
            side: const BorderSide(color: Color(0xFF3ABEFF), width: 1.5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1C1C2A),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF00C2D1)),
          ),
          hintStyle: const TextStyle(color: Color(0xFFB0B0B0)),
          labelStyle: const TextStyle(color: Color(0xFFF5F5F5)),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF00C2D1)),
      );

  Future<void> initializeApp() async {
    // Simulate some async loading (e.g., Firebase, assets, API)
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      title: 'Mahdi Tawbe',
      home: FutureBuilder(
        future: initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            // Lottie-based loading screen
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/loading/water.json',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Loading...',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          }

          // When done, show HomePage
          return const HomePage();
        },
      ),
    );
  }
}

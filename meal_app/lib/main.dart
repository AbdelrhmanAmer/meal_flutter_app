import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(
      const ProviderScope(
          child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
            seedColor: const Color.fromARGB(255, 132, 0, 51),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const TabsScreen(),
    );
  }
}

import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

var hColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF1976D2), // Blue
  brightness: Brightness.light,
);

var hDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF1E1E2F), // Deep Indigo/Gray
  brightness: Brightness.dark,
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //   fn,
  // ) {
  runApp(
    MaterialApp(
      home: Expenses(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: hDarkColorScheme,
        textTheme: GoogleFonts.robotoTextTheme()
            .apply(bodyColor: Colors.white, displayColor: Colors.white)
            .copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
          backgroundColor: hDarkColorScheme.primary,
          foregroundColor: Colors.white,
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFF2D2D40),
          margin: EdgeInsets.all(10),
          elevation: 4,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: hDarkColorScheme.secondary,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      theme: ThemeData(
        colorScheme: hColorScheme,
        textTheme: GoogleFonts.robotoTextTheme()
            .apply(bodyColor: Colors.black87, displayColor: Colors.black87)
            .copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
        appBarTheme: AppBarTheme(
          backgroundColor: hColorScheme.primaryContainer,
          foregroundColor: hColorScheme.onPrimaryContainer,
        ),
        cardTheme: CardThemeData(
          color: hColorScheme.secondaryContainer,
          margin: const EdgeInsets.all(10),
          elevation: 3,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: hColorScheme.primary,
            foregroundColor: hColorScheme.onPrimary,
          ),
        ),
      ),
    ),
  );
  // });
}

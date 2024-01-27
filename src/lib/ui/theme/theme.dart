import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        // appBarTheme: const AppBarTheme(
        //   elevation: 0,
        //   scrolledUnderElevation: 0,
        //   backgroundColor: Colors.transparent,
        // ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.white,
        ),
      );
}

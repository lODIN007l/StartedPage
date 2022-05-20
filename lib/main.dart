import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:habit_app/model/onboard_data.dart';
import 'package:habit_app/views/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habit App',
        theme: ThemeData(
          textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
        ),
        home: OnBoardingPage());
  }
}

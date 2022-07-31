import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixproject/core/colors/colors.dart';
import 'package:netflixproject/presentation/main_page/widgets/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),),
        primarySwatch: Colors.blue,
       scaffoldBackgroundColor: backgroundColor,
     fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home:  ScreenMainPage(),
    );
  }
}


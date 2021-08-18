// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netsign/screens/home_gallery.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      textTheme: TextTheme(
          headline1: GoogleFonts.workSans(
              color: Color(0xff080F18),
              fontSize: 18,
              fontWeight: FontWeight.bold),
          headline2: GoogleFonts.nunito(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          headline3:
              GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.bold),
          headline4: GoogleFonts.nunito(
              color: Color(0xff1A1824),
              fontSize: 16,
              fontWeight: FontWeight.w600)),
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.blue,
    ),
    home: HomeGallery(),
  ));
}

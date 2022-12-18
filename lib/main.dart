// ignore_for_file: prefer_const_literals_to_create_immutables, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:helpet_app/ui/pages/access/loginScreen.dart';
import 'package:helpet_app/ui/pages/onbordingPage/onbordingPage.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Helpet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnbordingPage(),
    );
  }
}

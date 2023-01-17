// ignore_for_file: file_names, unused_local_variable, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helpet_app/ui/pages/onbordingPage/onbordingPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnbordingPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logoHelpet.png",
              height: 200,
              width: 300,
            ),
            SizedBox(
              height: 100,
            ),
            Positioned(
              bottom: 90,
              left: 20,
              child: RichText(
                text: TextSpan(
                  text: " ",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

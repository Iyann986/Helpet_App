// ignore_for_file: file_names, unused_field, prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use, sort_child_properties_last, non_constant_identifier_names, avoid_types_as_parameter_names, avoid_print, unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:helpet_app/ui/model/onbordingModel.dart';
import 'package:helpet_app/ui/pages/access/loginScreen.dart';
import 'package:helpet_app/ui/pages/homepage/HomeScreen.dart';
import 'package:helpet_app/ui/theme/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({Key? key}) : super(key: key);

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: currentIndex % 1 == 0 ? kwhite : kblue,
      appBar: AppBar(
        backgroundColor: currentIndex % 1 == 0 ? kwhite : kblue,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              _storeOnboardInfo();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: currentIndex % 1 == 0 ? kgrey : kwhite,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].img,
                        height: 300,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6B62DB)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        contents[i].desc,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppinst',
                          color: Color(0xff717076),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.all(45),
            width: double.infinity,
            child: FlatButton(
              child: Text(
                  currentIndex == contents.length - 1 ? "Get Started" : "Next"),
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  );
                }
                _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              color: Color(0xff473DD5),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext) {
    return Container(
      height: 10,
      width: currentIndex == index ? 40 : 13,
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index ? kblue : kgrey,
      ),
    );
  }
}

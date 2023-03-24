// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable, depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:helpet_app/provider/auth_provider.dart';
import 'package:helpet_app/ui/pages/access/screen_login.dart';
import 'package:helpet_app/ui/pages/access/user_information_screen.dart';
import 'package:helpet_app/ui/pages/homepage/home_screen.dart';
import 'package:helpet_app/ui/theme/custom_button.dart';
import 'package:helpet_app/utils/utils.dart';
//import 'package:helpet_app/ui/theme/custom_button.dart';
//import 'package:helpet_app/utils/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenLogin(),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.help_rounded),
            color: Colors.black,
            iconSize: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: isLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff473DD5),
                  ),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 35),
                    child: Column(
                      children: [
                        const Text(
                          "Verification Code",
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 250,
                          height: 250,
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            "assets/images/Verification.png",
                          ),
                        ),
                        Text(
                          "We have sent the code verification to your mobile phone number",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Pinput(
                          length: 6,
                          showCursor: true,
                          defaultPinTheme: PinTheme(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff473DD5),
                              border: Border.all(
                                color: Color(0xff473DD5),
                              ),
                            ),
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onCompleted: (value) {
                            setState(() {
                              otpCode = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: CustomButton(
                            text: "Verify",
                            onPressed: () {
                              if (otpCode != null) {
                                verifyOtp(context, otpCode!);
                              } else {
                                showSnackBar(context, "Enter 6-Digit code");
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Didn't receive any code?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Resend New Code",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff7D63EB),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  //Verification otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        // checking whether user exists in the db
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              //user exists in our app
            } else {
              // new users
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false);
            }
          },
        );
      },
    );
  }
}

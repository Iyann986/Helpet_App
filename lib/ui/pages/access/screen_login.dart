// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_field, depend_on_referenced_packages, unnecessary_new, body_might_complete_normally_nullable, unused_local_variable, unused_element, avoid_print, unused_import

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helpet_app/provider/auth_provider.dart';
import 'package:helpet_app/ui/pages/access/register_screen.dart';
import 'package:helpet_app/ui/pages/homepage/home_screen.dart';
import 'package:helpet_app/ui/pages/onbordingPage/onbording_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helpet_app/ui/theme/colors.dart';
import 'package:helpet_app/ui/theme/custom_button.dart';

import 'package:provider/provider.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  //form key
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final TextEditingController phoneController = new TextEditingController();

  Country selectedCountry = Country(
    phoneCode: "62",
    countryCode: "ID",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Indonesia",
    example: "Indonesia",
    displayName: "Indonesia",
    displayNameNoCountryCode: "ID",
    e164Key: "",
  );

  //firebase
  final _auth = FirebaseAuth.instance;

  String? errorMessage;
  bool? remeber = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );

    //email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      cursorColor: Color(0xff473DD5),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //password
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        cursorColor: Color(0xff473DD5),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.https_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          //suffixIcon: ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xff473DD5),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OnbordingPage(),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      "Hello, welcome back to our account",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Inter',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xff473DD5),
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: TabBar(
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.black,
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 100,
                //   child: TabBarView(
                //     children: [
                //       Center(
                //         child: Container(
                //           child: Text('Email'),
                //         ),
                //       ),
                //       Container(child: Text('Phone Number')),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 450,
                  child: TabBarView(
                    children: [
                      Center(
                        child: SingleChildScrollView(
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(height: 15),
                                    emailField,
                                    SizedBox(height: 25),
                                    passwordField,
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                            value: remeber,
                                            onChanged: (value) {
                                              setState(() {
                                                remeber = value;
                                              });
                                            }),
                                        Text(
                                          "Remember me",
                                          style: TextStyle(
                                            color: Color(0xff717076),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            "Forgot password?",
                                            style: TextStyle(
                                              color: Color(0xff717076),
                                              fontSize: 15,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Lexend',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    loginButton,
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.15,
                                            color: Colors.grey,
                                          ),
                                          Text("Or sign in with"),
                                          Container(
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.11,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.google,
                                                color: Color(0xff473DD5),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.facebook,
                                                size: 30,
                                                color: Colors.blue,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Don't have an account? "),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterPage()));
                                          },
                                          child: Text(
                                            "Register",
                                            style: TextStyle(
                                              color: Color(0xff7D63EB),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Phone Number
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 38),
                            Text(
                              "We will send you a confirmation code",
                              style: TextStyle(
                                color: Color(0xff717076),
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                cursorColor: Color(0xff473DD5),
                                controller: phoneController,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    phoneController.text = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter phone number",
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade600,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                  prefixIcon: Container(
                                    padding: const EdgeInsets.all(11),
                                    child: InkWell(
                                      onTap: () {
                                        showCountryPicker(
                                            context: context,
                                            countryListTheme:
                                                CountryListThemeData(
                                              bottomSheetHeight: 550,
                                            ),
                                            onSelect: (value) {
                                              setState(() {
                                                selectedCountry = value;
                                              });
                                            });
                                      },
                                      child: Text(
                                        "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  suffixIcon: phoneController.text.length > 9
                                      ? Container(
                                          height: 20,
                                          width: 20,
                                          margin: const EdgeInsets.all(10.0),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green,
                                          ),
                                          child: const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: CustomButton(
                                  text: "Login",
                                  onPressed: () => sendPhoneNumber()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "${selectedCountry.phoneCode}$phoneNumber");
  }
}

// ignore_for_file: file_names, unused_field, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:helpet_app/ui/pages/bottombar/PromoPage.dart';
// import 'package:helpet_app/ui/pages/bottombar/akunPage.dart';

// import '../homepage/HomeScreen.dart';

// class BottomNavBar extends StatefulWidget {
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   late String? emailField = "";
//   int _selectedIndex = 0;

//   static TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

//   final _layoutpage = [
//     HomeScreen(),
//     PromoPage(),
//     AccountScreen(),
//   ];

//   // List _widgetOptions = [
//   //   HomeScreen(),
//   //   Text(
//   //     "Index 1: Coffee Shop ",
//   //     // style: optionStyle,
//   //   ),
//   //   Text(
//   //     'Index 2: Promo',
//   //     style: optionStyle,
//   //   ),
//   // ];

//   void _onTapItem(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffDDD1B1),
//       body: Center(
//         child: _layoutpage.elementAt(_selectedIndex),
//       ),
//       //_layoutpage.elementAt(_selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Color(0xffDDD1B1),
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//               backgroundColor: Colors.black),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.local_activity_rounded),
//               label: 'Promo',
//               backgroundColor: Colors.black),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle_sharp),
//               label: 'Account',
//               backgroundColor: Colors.black),
//         ],
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color(0xff814932),
//         onTap: _onTapItem,
//       ),
//     );
//   }
// }

// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Fontawesome extends StatelessWidget {
  const Fontawesome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
        icon: FaIcon(FontAwesomeIcons.gamepad),
        onPressed: () {
          List itemsTab = [
            {"icon": Icons.home, "size": 28.0},
            {"icon": FontAwesomeIcons.mapLocation, "size": 22.0},
            {"icon": FontAwesomeIcons.user, "size": 21.0},
            {"icon": FontAwesomeIcons.shop, "size": 22.0},
            {"icon": Icons.more_horiz, "size": 40.0},
          ];
        });
  }
}

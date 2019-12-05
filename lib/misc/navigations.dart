import 'package:chat/home/home_screen.dart';
import 'package:chat/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/misc/constants.dart' as Constants;

/**
 * Created by roman on 2019-11-30
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class Navigators {

  static void navigate(BuildContext context, String screen) {
    Navigator.of(context).pushReplacementNamed(screen);
  }

  static void goToLogin(BuildContext context, {bool addToBackStack: false}) {
    if (addToBackStack) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen())
      );
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen())
      );
    }
  }

  static void goToHome(BuildContext context, {bool addToBackStack: false}) {
    if (addToBackStack) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    }
  }

  static void goToCreateRoom(BuildContext context, {bool addToBackStack: false}) {
    if (addToBackStack) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    }
  }

  static void goToRoom(BuildContext context, String roomId, String name, {bool addToBackStack: false}) {
    if (addToBackStack) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    }
  }
}

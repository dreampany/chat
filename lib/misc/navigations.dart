import 'package:chat/login/login_screen.dart';
import 'package:flutter/material.dart';

/**
 * Created by roman on 2019-11-30
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class Navigators {
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
}
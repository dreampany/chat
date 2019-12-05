import 'dart:async';

import 'package:chat/misc/navigations.dart';
import 'package:chat/repo/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:chat/misc/constants.dart' as Constants;

/**
 * Created by roman on 2019-12-05
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var visible = true;
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: Constants.Ui.SPLASH_TIMEOUT));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    animation.addListener(() => this.setState(() {}));
    controller.forward();
    setState(() {
      visible = !visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child:   Text("Power By"),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Hello Splash By")
            ],
          )
        ],
      ),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: Constants.Ui.SPLASH_TIMEOUT);
    return Timer(duration, navigate);
  }

  void navigate() {
    LoginRepo.of().loggedIn().then((loggedIn) {
      if (loggedIn) {
        Navigators.navigate(context, Constants.Screen.HOME);
      } else {
        Navigators.navigate(context, Constants.Screen.LOGIN);
      }
    });
  }
}

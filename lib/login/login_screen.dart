import 'package:chat/misc/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}

class LoginWidget extends StatelessWidget {
  final LoginScreen screen;
  final LoginScreenState state;

  const LoginWidget({Key key, @required this.screen, @required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocBuilder(
        //bloc: BlocProvider.of<LoginBloc>(context),
          builder: null
      ),
    );
  }

  void goToHome() {
    //Navigators.goToLogin(context)
  }
}
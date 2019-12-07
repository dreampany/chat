import 'package:chat/home/home_bloc.dart';
import 'package:chat/home/home_state.dart';
import 'package:chat/model/user_item.dart';
import 'package:chat/misc/navigations.dart';
import 'package:chat/model/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat/misc/constants.dart' as Constants;
/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      builder: (context) => HomeBloc(),
      child: HomeWidget(screen: widget, state: this),
    );
  }
}

class HomeWidget extends StatelessWidget {
  final HomeScreen screen;
  final HomeScreenState state;

  const HomeWidget({Key key, @required this.screen, @required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatX'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.lock_open),
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).logout(this);
              })
        ],
      ),
      body: BlocBuilder(
          bloc: BlocProvider.of<HomeBloc>(context),
          builder: (context, HomeState state) {
            Widget content;
            if (state.loading) {
              content = Center(
                child: CircularProgressIndicator(strokeWidth: 4.0),
              );
            } else if (!state.hasRooms()) {
              content = Center(
                  child: Text(
                      "Looks like you don't have any active chatrooms\nLet's start one right now!",
                      textAlign: TextAlign.center));
            } else {
              content = ListView.builder(
                  padding: EdgeInsets.all(Constants.Ui.SMALLER_PADDING),
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: getItem(state.rooms[index]),
                      onTap: () {

                      },
                    );
                  }
              );
            }
          }),
    );
  }

  UserItem getItem(Room room) {
    return null;//UserItem(user: room.members.last);
  }

  void createRoom() {
    Navigators.goToCreateRoom(state.context, addToBackStack: true);
  }

  void goToLogin() {
    Navigators.goToLogin(state.context, addToBackStack: true);
  }

  void goToRoom(Room room) {
     //Navigators.goToRoom(state.context, room.id, room.name)
  }
}

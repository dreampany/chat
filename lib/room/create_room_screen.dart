import 'package:chat/model/room.dart';
import 'package:chat/model/user.dart';
import 'package:chat/model/user_item.dart';
import 'package:chat/room/create_room_bloc.dart';
import 'package:chat/room/create_room_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat/misc/constants.dart' as Constants;

/**
 * Created by roman on 2019-12-02
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */

class CreateRoomScreen extends StatefulWidget {
  @override
  CreateRoomScreenState createState() => CreateRoomScreenState();
}

class CreateRoomScreenState extends State<CreateRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateRoomBloc>(
      builder: (context) => CreateRoomBloc(),
      child: CreateRoomWidget(screen: widget, state: this),
    );
  }
}

class CreateRoomWidget extends StatelessWidget {
  final CreateRoomScreen screen;
  final CreateRoomScreenState state;

  const CreateRoomWidget({Key key, @required this.screen, @required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select User'),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<CreateRoomBloc>(context),
        builder: (context, CreateRoomState state) {
          if (state.loading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
              ),
            );
          }
          return ListView.builder(
              itemCount: state.userCount(),
              padding: EdgeInsets.all(Constants.Ui.SMALLER_PADDING),
              itemBuilder: (context, index) {
                return InkWell(
                  child: getItem(state.getUser(index)),
                  onTap: () {
                    createRoom(state.getUser(index));
                  },
                );
              });
        },
      ),
    );
  }

  Widget getItem(User user) {
    return UserItem(user: user);
  }

  void createRoom(BuildContext context, User user) {
    BlocProvider.of<CreateRoomBloc>(context).startChat(state.users[index], this);
  }

  void goToRoom(Room room) {
    //Navigators.goToRoom(state.context, room.id, room.name)
  }
}

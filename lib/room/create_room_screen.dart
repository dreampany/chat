import 'package:chat/model/room.dart';
import 'package:chat/model/user.dart';
import 'package:chat/model/user_item.dart';
import 'package:chat/room/create_room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return null;
  }

  Widget getItem(User user) {
    return UserItem(user: user);
  }

  void goToRoom(Room room) {
    //Navigators.goToRoom(state.context, room.id, room.name)
  }
}

import 'package:chat/model/room.dart';
import 'package:chat/model/user.dart';

/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class CreateRoomAction {
  final Room room;
  final bool canceled;

  CreateRoomAction(this.room, this.canceled);
}

class CreateRoomState {
  final bool loading;
  final List<User> users;
  final CreateRoomAction action;

  CreateRoomState._internal(this.loading, {this.users, this.action});

  factory CreateRoomState.initial() => CreateRoomState._internal( true);

  factory CreateRoomState.isLoading(bool loading, CreateRoomState state) =>
      CreateRoomState._internal(loading, users: state.users);

  factory CreateRoomState.users(List<User> users, CreateRoomState state) =>
      CreateRoomState._internal(state.loading, users: state.users);


  int userCount() {
    return users == null ? 0 : users.length;
  }

  User getUser(int index) {
    if (users == null || users.isEmpty) return null;
    return users[index];
  }
}

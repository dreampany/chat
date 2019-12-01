import 'package:chat/model/room.dart';

/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class HomeState {
  final bool loading;
  final List<Room> rooms;
  final Room room;
  final bool loggedIn;

  HomeState._internal(this.loading,
      {this.rooms, this.room, this.loggedIn = true});

  factory HomeState.initial() => HomeState._internal(false);

  factory HomeState.loading(bool loading, HomeState state) =>
      HomeState._internal(loading, rooms: state.rooms);

  factory HomeState.rooms(List<Room> rooms, HomeState state) =>
      HomeState._internal(state.loading, rooms: rooms);

  factory HomeState.enterRoom(Room room, HomeState state) =>
      HomeState._internal(false, rooms: state.rooms, room: room);

  factory HomeState.logout(HomeState state) =>
      HomeState._internal(false, rooms: state.rooms, loggedIn: false);

  factory HomeState.reset(HomeState state) =>
      HomeState._internal(state.loading, rooms: state.rooms);
}

import 'package:chat/model/room.dart';

/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
abstract class HomeEvent {}

class HomeErrorEvent extends HomeEvent {}

class ClearRoomsEvent extends HomeEvent {}

class RoomsUpdatedEvent extends HomeEvent {
  final List<Room> rooms;
  RoomsUpdatedEvent(this.rooms);
}
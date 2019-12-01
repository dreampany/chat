import 'package:chat/model/user.dart';

/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
abstract class CreateRoomEvent {}

class RoomUsersUpdatedEvent extends CreateRoomEvent {
  final List<User> users;
  RoomUsersUpdatedEvent(this.users);
}

class CreateRoomRequestedEvent extends CreateRoomEvent {}

class CancelCreateRoomEvent extends CreateRoomEvent {}
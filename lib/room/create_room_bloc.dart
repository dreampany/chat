import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chat/model/user.dart';
import 'package:chat/repo/user_repo.dart';
import 'package:chat/room/create_room_event.dart';
import 'package:chat/room/create_room_state.dart';
/**
 * Created by roman on 2019-12-02
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class CreateRoomBloc extends Bloc<CreateRoomEvent, CreateRoomState> {

  User currentUser;

  @override
  CreateRoomState get initialState {
    init();
    return CreateRoomState.initial();
  }

  @override
  Stream<CreateRoomState> mapEventToState(CreateRoomEvent event) {
    // TODO: implement mapEventToState
    return null;
  }

  void init()  async {
    currentUser = await UserRepo.of().currentUser();
  }

  void createRoom(User otherUser) {
    add(CreateRoomRequestedEvent());
    assert(currentUser != null);
    assert(currentUser != otherUser);
    List<User> rooms = List<User>();
    rooms.add(currentUser);
    rooms.add(otherUser);

  }
}
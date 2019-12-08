import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chat/model/user.dart';
import 'package:chat/repo/chat_repo.dart';
import 'package:chat/repo/room_repo.dart';
import 'package:chat/repo/user_repo.dart';
import 'package:chat/room/create_room_event.dart';
import 'package:chat/room/create_room_screen.dart';
import 'package:chat/room/create_room_state.dart';
/**
 * Created by roman on 2019-12-02
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class CreateRoomBloc extends Bloc<CreateRoomEvent, CreateRoomState> {
  User currentUser;
  StreamSubscription<List<User>> subscription;

  @override
  CreateRoomState get initialState {
    init();
    return CreateRoomState.initial();
  }

  @override
  Stream<CreateRoomState> mapEventToState(CreateRoomEvent event) async* {
    if (event is RoomUsersUpdatedEvent) {
      yield CreateRoomState.loading(false, CreateRoomState.users(event.users, state));
    } else if (event is CreateRoomRequestedEvent) {
      yield CreateRoomState.loading(true, state);
    }
  }

  @override
  Future<void> close() {
    if (subscription != null) subscription.cancel();
    return super.close();
  }

  void dispatchCancelEvent() {
    add(CancelCreateRoomEvent());
  }

  void resetState() {
    dispatchCancelEvent();
  }

  void init()  async {
    currentUser = await UserRepo.of().currentUser();
    subscription = ChatRepo.of().getUsers().listen((users) {
      List<User> result = users.toList();
      result.remove(currentUser);
      add(RoomUsersUpdatedEvent(result));
    });
  }

  void createRoom(User otherUser, CreateRoomWidget widget) {
    add(CreateRoomRequestedEvent());
    assert(currentUser != null);
    assert(currentUser != otherUser);
    List<User> users = List<User>();
    users.add(currentUser);
    users.add(otherUser);
    RoomRepo.of().startRoom(users).then((room) {
      widget.
    });
  }
}
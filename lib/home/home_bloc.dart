import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat/home/home_event.dart';
import 'package:chat/home/home_screen.dart';
import 'package:chat/home/home_state.dart';
import 'package:chat/model/room.dart';
import 'package:chat/repo/login_repo.dart';
import 'package:chat/repo/user_repo.dart';
import 'package:firebase_database/firebase_database.dart';
/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  StreamSubscription<List<Room>> roomsSubs;

  @override
  HomeState get initialState {
    return HomeState.initial();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) {
    // TODO: implement mapEventToState
    return null;
  }

  void logout(HomeWidget widget) {
    LoginRepo.of().signOut().then(
        (success) {
          //if (success)
          //ServerValue.timestamp
        }
    );
  }

  void loadRooms() async {
    add(ClearRoomsEvent());
    final user = await UserRepo.of().currentUser();
    if (user == null) {
      add(HomeErrorEvent());
      return;
    }
     //roomsSubs =
  }
}
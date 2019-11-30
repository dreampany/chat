import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat/login/login_event.dart';
import 'package:chat/login/login_screen.dart';
import 'package:chat/misc/constants.dart';
import 'package:chat/model/user.dart';
import 'package:chat/repo/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_state.dart';

/**
 * Created by roman on 2019-11-30
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  StreamSubscription<FirebaseUser> listener;

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) {
    // TODO: implement mapEventToState
    return null;
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }

  void setAuthListener(LoginWidget widget) {
    if (listener != null) return;
    listener = FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      if (user == null) {
        add(LogoutEvent());
      } else {
        final provider = user.providerId;
        UserRepo.of().setCurrentUser(User.fromFirebaseUser(user));
        widget.goToHome();
        logger.v(provider);
      }
    }, onError: (error) {
      add(LoginErrorEvent(error));
    });
  }
}

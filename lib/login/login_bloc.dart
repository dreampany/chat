import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat/login/login_event.dart';
import 'package:chat/login/login_screen.dart';
import 'package:chat/model/user.dart';
import 'package:chat/repo/login_repo.dart';
import 'package:chat/repo/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:chat/misc/constants.dart' as Constants;

import 'login_state.dart';

/**
 * Created by roman on 2019-11-30
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  StreamSubscription<FirebaseUser> subscription;

  @override
  LoginState get initialState => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithGoogleEvent) {
       yield LoginState.loading(false);
    } else if (event is LoginWithFacebookEvent) {
      yield LoginState.loading(false);
    } else if (event is LogoutEvent) {
      yield LoginState.loading(false);
    } else if (event is LoginEventInProgress) {
      yield LoginState.loading(true);
    } else if (event is LoginErrorEvent) {

    }
  }

  @override
  Future<void> close() {
    if (subscription != null) subscription.cancel();
    return super.close();
  }

  void setAuthListener(LoginWidget widget) {
    if (subscription != null) return;
    subscription = FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      if (user == null) {
        add(LogoutEvent());
      } else {
        final provider = user.providerId;
        UserRepo.of().setCurrentUser(User.fromFirebaseUser(user));
        widget.goToHome();
        Constants.logger.d("LOGIN SUCCESS" + provider);
      }
    }, onError: (error) {
      add(LoginErrorEvent(error));
      Constants.logger.e("LOGIN Error", error);
    });
  }

  void loginOnGoogle(LoginWidget widget) async {
    Constants.logger.d("LOGIN loginOnGoogle");
    add(LoginEventInProgress());
    final google = GoogleSignIn(scopes: [Constants.Keys.PROFILE, Constants.Keys.EMAIL]);
    final account = await google.signIn();
    if (account == null) {
      Constants.logger.d("LOGIN Account Not Found");
      add(LogoutEvent());
    } else {
      Constants.logger.d("LOGIN Account " + account.displayName);
      LoginRepo.of().signInWithGoogle(account);
    }
  }
}

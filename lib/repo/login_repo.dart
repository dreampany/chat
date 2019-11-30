import 'package:chat/model/response.dart';
import 'package:chat/model/user.dart';
import 'package:chat/repo/firebase_repo.dart';
import 'package:chat/repo/user_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat/misc/constants.dart' as Constants;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

/**
 * Created by roman on 2019-11-30
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class LoginRepo {
  static LoginRepo instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore firestore;

  LoginRepo._internal(this.firestore);

  factory LoginRepo.of() {
    if (instance == null)
      instance = LoginRepo._internal(FirebaseRepo.of().firestore);
    return instance;
  }

  Future<LoginResponse> signIn(AuthCredential credential) async {
    final result = await auth.signInWithCredential(credential);
    if (result == null || result.user == null) {
      return LoginFailedResponse(Constants.ErrorMessages.NO_USER_FOUND);
    } else {
      final token = await UserRepo.of().getToken();
      final user = User.fromFirebaseUser(result.user, token: token);
      await firestore
          .collection(Constants.Firestore.USERS)
          .document(Constants.Firestore.UID)
          .setData(user.map, merge: true);
      return LoginSuccessResponse(user);
    }
  }

  Future<bool> signOut() async {
    return auth.signOut().catchError((error) {
      Constants.logger
          .e("LoginRepo::logOut() encountered an error:\n${error.error}");
      return false;
    }).then((value) {
      return true;
    });
  }

  Future<LoginResponse> signInWithGoogle(GoogleSignInAccount account) async {
    final authentication = await account.authentication;
    final credential = GoogleAuthProvider.getCredential(idToken: authentication.idToken, accessToken: authentication.accessToken);
    return signIn(credential);
  }

  Future<LoginResponse> signInWithFacebook(FacebookLoginResult result) async {
    final credential = FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);
    return signIn(credential);
  }
}
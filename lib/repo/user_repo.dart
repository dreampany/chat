import 'package:chat/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chat/misc/constants.dart' as Constants;

/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class UserRepo {
  static UserRepo instance;

  UserRepo._internal();

  factory UserRepo.of() {
    if (instance == null) instance = UserRepo._internal();
    return instance;
  }

  Future<User> currentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString(Constants.Keys.ID);
    String name = prefs.getString(Constants.Keys.NAME);
    String photoUrl = prefs.getString(Constants.Keys.PHOTO_URL);
    String fcmToken = prefs.getString(Constants.Keys.TOKEN);
    if (uid == null || name == null || photoUrl == null) return null;
    return User(uid, name, photoUrl, fcmToken);
  }

  void setCurrentUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = user.token.isEmpty
        ? prefs.getString(Constants.Keys.TOKEN)
        : user.token;
    await prefs
        .setString(Constants.Keys.ID, user.id)
        .then((value) =>
            prefs.setString(Constants.Keys.NAME, user.name))
        .then((value) => prefs.setString(Constants.Keys.PHOTO_URL, user.photoUrl))
        .then((value) => prefs.setString(Constants.Keys.TOKEN, token));
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constants.Keys.TOKEN);
  }

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants.Keys.TOKEN, token);
  }

  void clearCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs
        .remove(Constants.Keys.ID)
        .then((value) => prefs.remove(Constants.Keys.NAME))
        .then((value) => prefs.remove(Constants.Keys.PHOTO_URL))
        .then((value) => prefs.remove(Constants.Keys.TOKEN));
  }
}

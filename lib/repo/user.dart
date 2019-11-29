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
    String uid = prefs.getString(Constants.UID);
    String name = prefs.getString(Constants.NAME);
    String photoUrl = prefs.getString(Constants.PHOTO_URL);
    String fcmToken = prefs.getString(Constants.FCM_TOKEN);
    if (uid == null || name == null || photoUrl == null) return null;
    return User(uid, name, photoUrl, fcmToken);
  }
  
  void setCurrentUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fcmToken = user.fcmToken.isEmpty ? prefs.getString(Constants.FCM_TOKEN) : user.fcmToken;
    await prefs.setString(Constants.UID, user.uid)
    .then((value) => prefs.setString(Constants.NAME, user.name))
    .then((value) => prefs.setString(Constants.PHOTO_URL, user.photoUrl))
    .then((value) => prefs.setString(Constants.FCM_TOKEN, fcmToken));
  }

  void clearCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }
}
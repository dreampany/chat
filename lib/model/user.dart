import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat/misc/constants.dart' as Constants;
/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */

class User {
  final String uid;
  final String displayName;
  final String photoUrl;
  final String fcmToken;

  User(this.uid, this.displayName, this.photoUrl, this.fcmToken);

  User.fromFirebaseUser(FirebaseUser user) : this(user.uid, user.displayName, user.photoUrl, Constants.EMPTY);

  Map<String, dynamic> get map {
    return {
      Constants.UID: uid,
      Constants.DISPLAY_NAME: displayName,
      Constants.PHOTO_URL: photoUrl,
      Constants.FCM_TOKEN: fcmToken
    };
  }
}

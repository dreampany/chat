import 'package:chat/misc/constants.dart' as Constants;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
@JsonSerializable()
class User {
  final String uid;
  final String name;
  final String photoUrl;
  final String token;

  User(this.uid, this.name, this.photoUrl, this.token);

  User.fromFirebaseUser(FirebaseUser user)
      : this(user.uid, user.displayName, user.photoUrl, Constants.EMPTY);

  Map<String, dynamic> get map {
    return {
      Constants.UID: uid,
      Constants.NAME: name,
      Constants.PHOTO_URL: photoUrl,
      Constants.TOKEN: token
    };
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

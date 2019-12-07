import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:chat/misc/constants.dart' as Constants;

part 'user.g.dart';

/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
@JsonSerializable()
class User {
  final String id;
  final String name;
  @JsonKey(name: Constants.Keys.PHOTO_URL)
  final String photoUrl;
  final String token;
  final int timestamp;

  User(this.id, this.name, this.photoUrl, this.token, {this.timestamp});

  User.fromFirebaseUser(FirebaseUser user,
      {String token: Constants.Common.EMPTY})
      : this(user.uid, user.displayName, user.photoUrl, token);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  Map<String, dynamic> get map {
    return {
      Constants.Keys.ID: id,
      Constants.Keys.NAME: name,
      Constants.Keys.PHOTO_URL: photoUrl,
      Constants.Keys.TOKEN: token,
      Constants.Keys.TIMESTAMP: timestamp
    };
  }
}

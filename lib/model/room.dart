import 'package:json_annotation/json_annotation.dart';
import 'package:chat/misc/constants.dart' as Constants;

part 'room.g.dart';
/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
@JsonSerializable()
class Room {
  final String id;
  final String name;
  final String author;
  final List<String> users;
  @JsonKey(name: Constants.Keys.LAST_MESSAGE_ID)
  final String lastMessageId;
  final int timestamp;

  Room(this.id, this.name, this.author, {this.users, this.lastMessageId, this.timestamp});

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);

/*  Map<String, dynamic> get map {
    return {
      Constants.Keys.ID: id,
      Constants.Keys.NAME: name,
      Constants.Keys.AUTHOR: author,
      Constants.Keys.USERS: users,
      Constants.Keys.LAST_MESSAGE_ID: lastMessageId,
      Constants.Keys.TIMESTAMP: timestamp
    };
  }*/
}

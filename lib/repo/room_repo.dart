import 'package:chat/model/room.dart';
import 'package:chat/model/user.dart';
import 'package:chat/repo/firebase_repo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rxdart/rxdart.dart';
import 'package:chat/misc/constants.dart' as Constants;
/**
 * Created by roman on 2019-12-06
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class RoomRepo {
  static RoomRepo instance;
  final FirebaseDatabase database;
  final rooms = BehaviorSubject<List<Room>>();

  RoomRepo._internal(this.database);

  factory RoomRepo.of() {
    if (instance == null) {
      instance = RoomRepo._internal(FirebaseRepo.of().database);
    }
    return instance;
  }

  void dismiss() {
    rooms.close();
  }

  Future<Room> startRoom(List<User> members) async {
    String roomId = Constants.Api.createRoomId(members);
    DatabaseReference ref = database.reference().child(Constants.Common.CHAT).child(Constants.Common.ROOMS).child(roomId);
    ref.once().then((snapshot) {
      if (snapshot.value == null) {

      } else {
        return snapshot.value;
      }
    });

  }
}
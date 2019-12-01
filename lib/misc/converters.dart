import 'package:chat/model/room.dart';
import 'package:chat/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat/misc/constants.dart' as Constants;
/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */

class Converters {
  static User getUser(DocumentSnapshot snapshot) {
    return User(snapshot[Constants.UID], snapshot[Constants.NAME],
        snapshot[Constants.PHOTO_URL], snapshot[Constants.TOKEN]);
  }

  static List<User> getUsersOf(List<DocumentSnapshot> snapshots) {
    return snapshots.map((snapshot) => getUser(snapshot)).toList();
  }

  static List<Room> getRooms(
      List<DocumentSnapshot> snapshots, List<User> users) {
    return snapshots.map((snapshot) => getRoom(snapshot, users)).toList();
  }

  static Room getRoom(DocumentSnapshot snapshot, List<User> users) {
    List<DocumentReference> refs = List<DocumentReference>(2);
    refs[0] = snapshot[Constants.Firestore.PARTICIPANTS][0];
    refs[1] = snapshot[Constants.Firestore.PARTICIPANTS][1];
    List<User> resultUsers = getUsers(refs, users);
    return Room(participants: resultUsers);
  }

  static List<User> getUsers(List<DocumentReference> refs, List<User> users) {
    return users
        .where((user) => refs.any((ref) => ref.documentID == user.uid))
        .toList();
  }

  static Map<String, dynamic> getMessage(
      DocumentReference authorRef, String message) {
    return {
      Constants.Firestore.AUTHOR: authorRef,
      Constants.Firestore.TIMESTAMP: DateTime.now(),
      Constants.Firestore.DATA: message,
    };
  }
}

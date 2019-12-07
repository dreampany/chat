import 'package:chat/model/room.dart';
import 'package:chat/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat/misc/constants.dart' as Constants;
import 'package:firebase_database/firebase_database.dart';
/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */

class Converters {
  static List<User> getUserOfDataSnapshot(DataSnapshot snap) {
    if (snap.value == null) return null;
    List<User> users = List<User>();
    Map<dynamic, dynamic> map = snap.value;
    map.forEach((key, value) {
      users.add(User.fromJson(value));
    });
    return users;
  }

  static User getUser(DocumentSnapshot snapshot) {
    return null;
    /*User(snapshot[Constants.ID], snapshot[Constants.NAME],
        snapshot[Constants.PHOTO_URL], snapshot[Constants.TOKEN]);*/
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
    refs[0] = snapshot[Constants.Keys.USERS][0];
    //refs[1] = snapshot[Constants.Firebase.PARTICIPANTS][1];
    List<User> resultUsers = getUsers(refs, users);
    return null;
  }

  static List<User> getUsers(List<DocumentReference> refs, List<User> users) {
    return users
        .where((user) => refs.any((ref) => ref.documentID == user.id))
        .toList();
  }

  static Map<String, dynamic> getMessage(
      DocumentReference authorRef, String message) {
    return {
      //Constants.Firebase.AUTHOR: authorRef,
      //Constants.Firebase.TIMESTAMP: ServerValue.timestamp,
      //Constants.Firebase.DATA: message,
    };
  }

  static Map<String, dynamic> createRoom(
      DocumentReference authorRef, String message) {
    return {
      //Constants.Firebase.AUTHOR: authorRef,
      //Constants.Firebase.TIMESTAMP: ServerValue.timestamp,
      //Constants.Firebase.DATA: message,
    };
  }
}

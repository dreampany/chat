import 'package:chat/misc/converters.dart';
import 'package:chat/model/room.dart';
import 'package:chat/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rxdart/rxdart.dart';
import 'firebase_repo.dart';
import 'package:chat/misc/constants.dart' as Constants;

/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class ChatRepo {
  static ChatRepo instance;
  final FirebaseDatabase database;
  final Firestore firestore;
  final subject = BehaviorSubject<List<User>>();

  ChatRepo._internal(this.database, this.firestore);

  factory ChatRepo.of() {
    if (instance == null) {
      instance = ChatRepo._internal(
          FirebaseRepo.of().database, FirebaseRepo.of().firestore);
      instance.loadUsers();
    }
    return instance;
  }

  void dismiss() {
    subject.close();
  }

  void loadUsers() {
    DatabaseReference ref = database
        .reference()
        .child(Constants.Keys.CHAT)
        .child(Constants.Keys.USERS);
    ref.onValue
        .map((event) => Converters.getUserOfDataSnapshot(event.snapshot))
        .listen((users) {
        subject.sink.add(users);
    });
/*    firestore
        .collection(Constants.Keys.USERS)
        .orderBy(Constants.Keys.NAME)
        .snapshots()
        .map((data) => Converters.getUsersOf(data.documents))
        .listen((users) {
      subject.sink.add(users);
    });*/
  }

  Stream<List<User>> getUsers() {
    return subject.stream;
  }

  Future<Room> getRoom(String roomId, User currentUser, User otherUser) async {
    DocumentReference roomRef =
        firestore.collection(Constants.Keys.ROOMS).document(roomId);
    if (roomRef == null) return null;
    List<User> participants = List<User>(2);
    participants.add(currentUser);
    participants.add(otherUser);
    return null;
  }

  Stream<List<Room>> getRooms(User user) {
    DocumentReference userRef =
        firestore.collection(Constants.Keys.USERS).document(user.id);
    return firestore
        .collection(Constants.Keys.ROOMS)
        .where(Constants.Keys.USERS, arrayContains: userRef)
        .snapshots()
        .map((data) => Converters.getRooms(data.documents, subject.value));
  }

  Future<Room> startRoom(User currentUser, User otherUser) async {
    DocumentReference currentRef =
        firestore.collection(Constants.Keys.USERS).document(currentUser.id);
    //QuerySnapshot snapshot =await
  }

  Future<bool> sendMessage(
      String roomId, User currentUser, String message) async {
    try {
      DocumentReference authorRef =
          firestore.collection(Constants.Keys.USERS).document(currentUser.id);
      DocumentReference roomRef =
          firestore.collection(Constants.Keys.ROOMS).document(roomId);
      Map<String, dynamic> map = Converters.getMessage(authorRef, message);
      roomRef.updateData({
        Constants.Keys.MESSAGES: FieldValue.arrayUnion([map])
      });
      return true;
    } catch (error) {
      Constants.logger.e("CHAT", error);
      return false;
    }
  }
}

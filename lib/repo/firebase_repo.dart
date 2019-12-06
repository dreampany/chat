import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

/**
 * Created by roman on 2019-11-30
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class FirebaseRepo {
  static FirebaseRepo instance;
  final FirebaseDatabase database;
  final Firestore firestore;

  const FirebaseRepo._internal(this.database, this.firestore);

  factory FirebaseRepo.of() {
    if (instance == null) {
      instance = FirebaseRepo._internal(FirebaseDatabase.instance, Firestore.instance);
      instance.firestore.settings(persistenceEnabled: true, timestampsInSnapshotsEnabled: true);
    }
    return instance;
  }


}

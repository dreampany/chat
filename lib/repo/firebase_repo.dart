import 'package:cloud_firestore/cloud_firestore.dart';

/**
 * Created by roman on 2019-11-30
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class FirebaseRepo {
  static FirebaseRepo instance;
  final Firestore firestore;

  const FirebaseRepo._internal(this.firestore);

  factory FirebaseRepo.of() {
    if (instance == null) {
      instance = FirebaseRepo._internal(Firestore.instance);
      instance.firestore.settings(
          persistenceEnabled: true, timestampsInSnapshotsEnabled: true);
    }
    return instance;
  }
}

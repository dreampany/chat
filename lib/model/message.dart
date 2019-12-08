import 'package:cloud_firestore/cloud_firestore.dart';

/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class Message {
  final String author;
  final String data;
  final Timestamp timestamp;
  final bool out;

  Message(this.author, this.data, this.timestamp, [this.out = false]);
}
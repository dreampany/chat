import 'package:chat/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class Message {
  final User author;
  final Timestamp timestamp;
  final String data;
  final bool out;

  Message(this.author, this.timestamp, this.data, [this.out = false]);
}
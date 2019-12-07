import 'package:chat/model/user.dart';

/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */

class Room {
  final String id;
  final String name;
  final String author;
  final List<String> members;
  final String lastMessageId;
  final int timestamp;

  Room(this.id, this.name, this.author,
      {this.members, this.lastMessageId, this.timestamp});
}

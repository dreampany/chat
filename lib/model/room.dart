import 'package:chat/model/message.dart';
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
  final List<User> participants;
  final List<Message> messages;

  Room(this.id, this.name, this.participants, this.messages);
}
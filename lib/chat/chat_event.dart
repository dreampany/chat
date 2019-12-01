import 'package:chat/model/message.dart';

/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
abstract class ChatEvent {}

class MessageReceivedEvent extends ChatEvent {
  final List<Message> messages;

  MessageReceivedEvent(this.messages);
}

class MessageSendErrorEvent extends ChatEvent {}
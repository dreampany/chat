import 'package:chat/model/message.dart';

/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class ChatState {
  final bool loading;
  final List<Message> messages;
  final bool error;

  ChatState._internal(this.loading, this.messages, {this.error = false});

  factory ChatState.initial() => ChatState._internal(true, List<Message>(0));

  factory ChatState.messages(List<Message> messages) => ChatState._internal(false, messages);

  factory ChatState.error(ChatState state) => ChatState._internal(state.loading, state.messages, error: true);
}
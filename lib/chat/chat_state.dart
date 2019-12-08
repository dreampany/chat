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

  ChatState._internal(this.loading, {this.messages, this.error = false});

  factory ChatState.initial() => ChatState._internal(true);

  factory ChatState.messages(List<Message> messages) =>
      ChatState._internal(false, messages: messages);

  factory ChatState.error(ChatState state) =>
      ChatState._internal(state.loading, messages: state.messages, error: true);

  int messageCount() {
    return messages == null ? 0 : messages.length;
  }

  Message getMessage(int index) {
    if (messages == null || messages.isEmpty) return null;
    return messages[index];
  }
}

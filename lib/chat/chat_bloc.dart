import 'dart:async';

import 'package:chat/chat/chat_event.dart';
import 'package:chat/chat/chat_state.dart';
import 'package:bloc/bloc.dart';
import 'package:chat/model/room.dart';
import 'package:chat/model/user.dart';
import 'package:chat/repo/chat_repo.dart';
import 'package:chat/repo/user_repo.dart';

/**
 * Created by roman on 2019-12-04
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final String roomId;
  StreamSubscription<Room> subscription;

  ChatBloc(this.roomId);

  @override
  ChatState get initialState {
loadMessages();
    return ChatState.initial();
  }

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is MessageReceivedEvent)
      yield ChatState.messages(event.messages);
    else if (event is MessageSendErrorEvent)
      yield ChatState.error(state);
  }

  @override
  Future<void> close() {
    if (subscription != null) subscription.cancel();
    return super.close();
  }

  void loadMessages() async {
    final User user = await UserRepo.of().currentUser();
    //subscription = ChatRepo.of().ge
  }
}

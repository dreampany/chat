import 'package:chat/chat/chat_bloc.dart';
import 'package:chat/chat/chat_state.dart';
import 'package:chat/model/message.dart';
import 'package:chat/model/message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat/misc/constants.dart' as Constants;

/**
 * Created by roman on 2019-12-04
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class ChatScreen extends StatefulWidget {
  final String roomId, name;

  ChatScreen({Key key, @required this.roomId, @required this.name})
      : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState(roomId);
}

class ChatScreenState extends State<ChatScreen> {
  final String roomId;

  ChatScreenState(this.roomId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBloc>(
      builder: (context) => ChatBloc(roomId),
      child: ChatWidget(screen: widget, state: this),
    );
  }
}

class ChatWidget extends StatelessWidget {
  final ChatScreen screen;
  final ChatScreenState state;

  const ChatWidget({Key key, @required this.screen, @required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screen.name),
      ),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<ChatBloc>(context),
        builder: (context, ChatState state) {
          if (state.error) {
            return Center(
              child: Text("An error ocurred"),
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.max,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                getInput(),

              ],
            );
          }
        });
  }

  Widget getInput() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[

      ],
    );
  }

  Widget getListView(ChatState state) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.Ui.SMALLER_PADDING,
        vertical: Constants.Ui.SMALLER_PADDING,
      ),
      itemCount: state.messageCount(),
      reverse: true,
      itemBuilder: (context, index) => getMessageItem(state.getMessage(index)),
    );
  }

  Widget getMessageItem(Message message) {
    return MessageItem(message: message);
  }

}

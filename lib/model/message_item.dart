import 'package:chat/model/message.dart';
import 'package:flutter/material.dart';
import 'package:chat/misc/constants.dart' as Constants;

/**
 * Created by roman on 2019-12-08
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class MessageItem extends StatelessWidget {
  final Message message;

  MessageItem({Key key, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message.out) {
      return getOutItem(message);
    }
    return getInItem(message);
  }

  Widget getOutItem(Message message) {
    return Container(
      child: Text(
        message.data,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.end,
      ),
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.all(Radius.circular(6.0))),
      padding: EdgeInsets.all(Constants.Ui.SMALLER_PADDING),
      margin: EdgeInsets.symmetric(
        vertical: Constants.Ui.SMALLER_PADDING / 2.0,
        horizontal: 0.0,
      ),
    );
  }

  Widget getInItem(Message message) {
    return Container(
      child: Text(
        message.data,
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(6.0))),
      padding: EdgeInsets.all(Constants.Ui.SMALLER_PADDING),
      margin: EdgeInsets.symmetric(
        vertical: Constants.Ui.SMALLER_PADDING / 2.0,
        horizontal: 0.0,
      ),
    );
  }
}

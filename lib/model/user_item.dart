import 'package:chat/model/user.dart';
import 'package:flutter/material.dart';
import 'package:chat/misc/constants.dart' as Constants;

/**
 * Created by roman on 2019-12-01
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class UserItem extends StatelessWidget {
  final User user;

  UserItem({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 0, vertical: Constants.Ui.SMALLER_PADDING),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(48.0),
            child: Image.network(user.photoUrl, width: 96, height: 96),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(Constants.Ui.SMALLER_PADDING),
            child: Text(
              user.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: Constants.Ui.BIGGER_FONT_SIZE,
                  color: Colors.blueAccent),
            ),
          ),
        ),
      ],
    );
  }
}

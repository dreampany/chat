library Constants;

import 'package:chat/model/user.dart';
import 'package:logger/logger.dart';

/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
var logger = Logger(
  printer: PrettyPrinter(),
);

class Sep {
  static const String UNDERSCORE = '_';
}

class Common extends Sep {
  static const String EMPTY = '';
  static const int INT = 0;
  static const double DOUBLE = 0.0;
  static const String ID = 'id';
  static const String TIMESTAMP = 'timestamp';
}

class Screen {
  static const String LOGIN = 'login';
  static const String HOME = 'home';
}

class Ui {
  static const int SPLASH_TIMEOUT = 2;

  // FONT SIZE
  static const double SMALLER_FONT_SIZE = 10.0;
  static const double STANDARD_FONT_SIZE = 14.0;
  static const double BIGGER_FONT_SIZE = 18.0;

  // PADDING
  static const double SMALLER_PADDING = 8.0;
  static const double STANDARD_PADDING = 16.0;
  static const double BIGGER_PADDING = 24.0;

  // ELEVATION
  static const double STANDARD_ELEVATION = 3.0;
}

class ErrorMessages {
  static const String NO_USER_FOUND =
      'Login failed because there is no user in the database';
}

class Keys extends Common {
  static const String ID = Common.ID;
  static const String NAME = 'name';
  static const String PHOTO_URL = 'photo_url';
  static const String TOKEN = 'token';
  static const String TIMESTAMP = Common.TIMESTAMP;
  static const String CHAT = 'chat';
  static const String USERS = 'users';
  static const String ROOMS = 'rooms';
  static const String USER = 'user';
  static const String UID = 'uid';
  static const String AUTHOR = 'author';
  static const String DATA = 'data';
  static const String MESSAGES = 'messages';
  static const String PROFILE = 'profile';
  static const String EMAIL = 'email';
  static const String LOGGED_IN = 'logged_in';
  static const String LAST_MESSAGE_ID = 'last_message_id';
}

class Api {
  static List<String> toIds(List<User> users) {
    List<String> ids = List<String>();
    users.forEach((user) {
      ids.add(user.id);
    });
    return ids;
  }

  static String createRoomId(List<User> users) {
    List<String> ids = List<String>();
    users.forEach((user) {
      ids.add(user.id);
    });
    ids.sort();
    return ids.join();
  }

  static String findRoomName(User author, List<User> users) {
    List<User> list = List<User>.of(users);
    list.remove(author);
    User other = list.first;
    return other.name;
  }
}

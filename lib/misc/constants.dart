library Constants;

import 'package:logger/logger.dart';
/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */

const String EMPTY = '';


const String USER = 'user';
const String UID = 'uid';
const String NAME = 'name';
const String PHOTO_URL = 'photoUrl';
const String TOKEN = 'token';
const String PROFILE = 'profile';
const String EMAIL = 'email';

var logger = Logger(
  printer: PrettyPrinter(),
);

class Ui {
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
  static const String NO_USER_FOUND = 'Login failed because there is no user in the database';
}

class Firestore {
  static const String USERS = 'users';
  static const String ROOMS = 'rooms';
  static const String UID = 'uid';
  static const String PARTICIPANTS = 'participants';
  static const String AUTHOR = 'author';
  static const String TIMESTAMP = 'timestamp';
  static const String DATA = 'data';
  static const String MESSAGES = 'messages';
}
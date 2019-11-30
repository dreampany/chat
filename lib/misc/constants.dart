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

class ErrorMessages {
  static const String NO_USER_FOUND = "Login failed because there is no user in the database";
}

class Firestore {
  static const String USERS = "users";
  static const String ROOMS = "rooms";
  static const String UID = USERS + "/{uid}";
}
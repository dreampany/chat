/**
 * Created by roman on 2019-11-28
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */

abstract class LoginResponse {}

class LoginFailedResponse extends LoginResponse {
  final String error;
  LoginFailedResponse(this.error);
}




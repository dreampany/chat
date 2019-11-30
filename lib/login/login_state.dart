/**
 * Created by roman on 2019-11-30
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class LoginState {
  bool loading;

  LoginState._internal({this.loading});

  factory LoginState.initial() => LoginState._internal(loading: false);

  factory LoginState.loading(bool loading) => LoginState._internal(loading: loading);
}
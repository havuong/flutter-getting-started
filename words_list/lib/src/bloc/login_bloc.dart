import 'dart:async';

import 'package:words_list/src/validators/validations.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String username, String pass) {
    if (!Validations.isValidUser(username)) {
      _userController.sink.addError(
          'Username is invalid'); //sink: input data, stream: output data
      return false;
    }
    if (!Validations.isValidPass(pass)) {
      _passController.sink
          .addError('Password should be more than 6 chareacters');
      return false;
    }
    _userController.sink.add('OK');
    _passController.sink.add('OK');
    return true;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}

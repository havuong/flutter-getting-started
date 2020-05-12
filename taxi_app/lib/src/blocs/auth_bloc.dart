import 'dart:async';
import 'package:taxi_app/src/fire_base/fire_base_auth.dart';

class AuthBloc {
  var _firAuth = FirAuth();

  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();
  StreamController _phoneController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneStream => _phoneController.stream;

  bool isValid(String name, String email, String pass, String phone) {
    bool flag = true;
    if (name == null || name.length == 0) {
      _nameController.sink.addError("Enter name");
      flag = false;
    } else {
      _nameController.sink.add("");
    }

    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("Enter phone number");
      flag = false;
    } else {
      _phoneController.sink.add("");
    }

    if (email == null || email.length == 0) {
      _emailController.sink.addError("Enter email");
      flag = false;
    } else {
      _emailController.sink.add("");
    }

    if (pass == null || pass.length < 6) {
      _passController.sink
          .addError("Password should be more than 5 characters");
      flag = false;
    } else {
      _passController.sink.add("");
    }

    return flag;
  }

  void signUp(String email, String pass, String phone, String name,
      Function onSuccess, Function(String) onError) {
    _firAuth.signUp(email, pass, name, phone, onSuccess, onError);
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _firAuth.signIn(email, pass, onSuccess, onSignInError);
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passController.close();
    _phoneController.close();
  }
}

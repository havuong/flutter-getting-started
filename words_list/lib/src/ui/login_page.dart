import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _passController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  var _userNameErr = 'Username is invalid';
  var _passErr = 'Password is invalid';
  var _userInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                  child: FlutterLogo(),
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  "Hello\nWelcome Back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                  controller: _usernameController,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    labelText: 'USERNAME',
                    errorText: _userInvalid ? _userNameErr : null,
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: TextField(
                      controller: _passController,
                      obscureText: !_showPass,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        errorText: _passInvalid ? _passErr : null,
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTapDown: _onTapDownShowPass,
                    onTapUp: _onTapUpShowPass,
                    child: Text(
                      _showPass ? 'HIDE' : 'SHOW',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  onPressed: _onSignInClicked,
                  child: Text('SIGN IN',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'NEW USER? SIGN UP',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'FORGOT PASSWORD?',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }

  void _onSignInClicked() {
    setState(() {
      if (_usernameController.text.length < 8 ||
          !_usernameController.text.contains('@')) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }

      if (_passController.text.length < 6) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }

      if (!_userInvalid && !_passInvalid) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  // Widget goToHome(BuildContext context) {
  //   return HomePage();
  // }

  void _onTapDownShowPass(TapDownDetails details) {
    setState(() {
      _showPass = true;
    });
  }

  void _onTapUpShowPass(TapUpDetails details) {
    setState(() {
      _showPass = false;
    });
  }
}

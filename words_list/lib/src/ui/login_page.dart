import 'package:flutter/material.dart';
import 'package:words_list/src/bloc/login_bloc.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc = new LoginBloc();
  bool _showPass = false;
  TextEditingController _passController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();

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
                  child: StreamBuilder(
                    stream: bloc.userStream,
                    builder: (context, snapshot) => TextField(
                      controller: _usernameController,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        labelText: 'USERNAME',
                        errorText: snapshot.hasError ? snapshot.error : null,
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    StreamBuilder(
                      stream: bloc.passStream,
                      builder: (context, snapshot) => TextField(
                        controller: _passController,
                        obscureText: !_showPass,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          errorText: snapshot.hasError ? snapshot.error : null,
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
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
              ),
              Container(
                width: double.infinity,
                height: 130,
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
    if (bloc.isValidInfo(_usernameController.text, _passController.text)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

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

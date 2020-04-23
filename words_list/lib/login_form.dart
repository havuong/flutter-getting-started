import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showPass;
  TextEditingController _passController;
  TextEditingController _usernameController;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                    width: 70,
                    height: 70,
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Text(
                    "Hello\nWelcome Back",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: TextField(
                    controller: _usernameController,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      labelText: 'USERNAME',
                      errorText: 'Username không hợp lệ',
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
                          errorText: 'Password không hợp lệ',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTapDown: _onToggleShowPass,
                      onTapUp: _onToggleShowPassAAA,
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
      ),
    );
  }

  void _onSignInClicked() {}

  void _onToggleShowPass(TapDownDetails details) {
    setState(() {
      _showPass = true;
    });
  }

  void _onToggleShowPassAAA(TapUpDetails details) {
    setState(() {
      _showPass = false;
    });
  }
}

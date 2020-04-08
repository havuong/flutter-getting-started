import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      color: Colors.deepPurple,
      child: Text("Pizza", textDirection: TextDirection.ltr)
    );
  }
  
}
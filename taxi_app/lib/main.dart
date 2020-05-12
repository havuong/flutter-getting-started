import 'package:flutter/material.dart';
import 'package:taxi_app/src/app.dart';
import 'package:taxi_app/src/blocs/auth_bloc.dart';
import 'package:taxi_app/src/ui/login_page.dart';

void main() {
  runApp(TaxiCar(
      new AuthBloc(),
      MaterialApp(
        home: LoginPage(),
      )));
}

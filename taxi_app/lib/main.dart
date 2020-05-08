import 'package:flutter/material.dart';
import 'package:taxi_app/src/blocs/auth_bloc.dart';
import 'package:taxi_app/src/ui/login_page.dart';
import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TaxiCar(
      new AuthBloc(),
      MaterialApp(
        home: LoginPage(),
      )));
}

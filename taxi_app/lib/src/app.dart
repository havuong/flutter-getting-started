import 'package:flutter/material.dart';
import 'package:taxi_app/src/blocs/auth_bloc.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginPage(),
//     );
//   }
// }

class TaxiCar extends InheritedWidget {
  final AuthBloc autoBloc;
  final Widget child;
  TaxiCar(this.autoBloc, this.child) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return null;
  }

  static TaxiCar of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaxiCar>();
  }
}

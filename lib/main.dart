import 'package:flutter/material.dart';
import 'package:stepper/auth/auth.dart';
import 'package:stepper/auth/auth_provider.dart';
import 'package:stepper/root_page.dart';
import 'ui/login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Stepper',
        theme: ThemeData(
            accentColor: Colors.black,
            primaryColor: Colors.black,
            fontFamily: "Montserrat"),
        home: RootPage(),
      ),
    );
  }
}

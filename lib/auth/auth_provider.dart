import 'package:flutter/material.dart';
import 'package:stepper/auth/auth.dart';

class AuthProvider extends InheritedWidget {
  AuthProvider({Key key, Widget child, this.auth}) : super(key: key, child: child);
  final BaseAuth auth;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AuthProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AuthProvider) as AuthProvider);
  }
}

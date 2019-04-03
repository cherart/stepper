import 'package:flutter/material.dart';
import 'package:stepper/auth/auth_provider.dart';
import 'package:stepper/ui/login/login_page.dart';
import 'package:stepper/ui/main_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

enum AuthStatus { signedIn, notSignedIn }

class _RootState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void didChangeDependencies() {
    AuthProvider.of(context).auth.currentUser().then((id) {
      setState(() {
        _authStatus = id == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(
          onSignedIn: onSignedIn,
        );
      case AuthStatus.signedIn:
        return MainPage();
    }
  }

  void onSignedIn() {
    setState(() {
      _authStatus = AuthStatus.signedIn;
    });
  }
}

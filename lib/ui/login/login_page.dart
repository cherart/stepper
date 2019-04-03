import 'package:flutter/material.dart';
import 'package:stepper/auth/auth_provider.dart';
import 'package:stepper/auth/validator.dart';
import '../main_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.onSignedIn});

  final VoidCallback onSignedIn;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  int page = 0;//TODO remove
  int _duration = 300;

  String name;
  String email;
  String password;

  PageController _controller = PageController(initialPage: 0);
  final formKeySignIn = GlobalKey<FormState>();
  final formKeySignUp = GlobalKey<FormState>();

  void validate() async {
    if (_controller.page == 0) {
      var form = formKeySignIn.currentState;
      if (form.validate()) {
        form.save();
        try {
          String id = await AuthProvider.of(context)
              .auth
              .signInWithEmailAndPassword(email, password);
          widget.onSignedIn();
        } catch (e) {
          print(e);
        }
      }
    } else {
      var form = formKeySignUp.currentState;
      if (form.validate()) {
        form.save();
        try {
          String id = await AuthProvider.of(context)
              .auth
              .createUserWithEmailAndPassword(email, password, name);
          widget.onSignedIn();
        } catch (e) {
          print(e);
        }
      }
    }
  }

  void goToMainPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) => buildLogin(context);

  Widget buildLogin(BuildContext context) => Scaffold(
        body: Container(
          decoration: buildGradient(),
          child: buildLoginCenter(),
        ),
      );

  BoxDecoration buildGradient() => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey[300], Colors.white],
        ),
      );

  Center buildLoginCenter() => Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildImageLogo(),
              buildTextLogo(),
              SizedBox(height: 32),
              Container(
                height: 436,
                width: double.infinity,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    buildSignIn(),
                    buildSignUp(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Image buildImageLogo() => Image(
        image: AssetImage("assets/foots.png"),
        height: 48,
        width: 48,
      );

  Text buildTextLogo() =>
      Text("Stepper", style: TextStyle(fontSize: 24, color: Colors.black));

  Stack buildSignIn() => Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(32, 32, 32, 104),
            child: Card(
              elevation: 10,
              child: Form(
                key: formKeySignIn,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                          validator: Validator.validateEmail,
                          onSaved: (value) => email = value,
                          decoration: InputDecoration(
                              hintText: "Enter your email",
                              prefixIcon: Icon(Icons.email),
                              hintStyle: TextStyle(fontSize: 14))),
                      TextFormField(
                        validator: Validator.validatePassword,
                        onSaved: (value) => password = value,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          prefixIcon: Icon(Icons.vpn_key),
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Image(
                                image: AssetImage("assets/facebook.png"),
                                height: 40,
                                width: 40),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Image(
                                image: AssetImage("assets/google.png"),
                                height: 40,
                                width: 40),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          buildRaisedButton(context, "SIGN IN", () {
            validate();
          }),
          buildText('SIGN UP', () {
            page++;
            _controller.nextPage(
                duration: Duration(milliseconds: _duration),
                curve: Curves.easeIn);
          }),
        ],
      );

  Stack buildSignUp() => Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(32, 32, 32, 104),
            child: Card(
              elevation: 10,
              child: Form(
                key: formKeySignUp,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: Validator.validateName,
                        onSaved: (value) => name = value,
                        decoration: InputDecoration(
                          hintText: "Name",
                          contentPadding: EdgeInsets.all(4),
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                      TextFormField(
                        validator: Validator.validateEmail,
                        onSaved: (value) => email = value,
                        decoration: InputDecoration(
                          hintText: "Email",
                          contentPadding: EdgeInsets.all(4),
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                      TextFormField(
                        validator: Validator.validatePassword,
                        onSaved: (value) => password = value,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding: EdgeInsets.all(4),
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          buildRaisedButton(context, "SIGN UP", () {
            validate();
          }),
          buildText('SIGN IN', () {
            page--;
            _controller.previousPage(
                duration: Duration(milliseconds: _duration),
                curve: Curves.easeIn);
          }),
        ],
      );

  Widget buildRaisedButton(
          BuildContext context, String text, VoidCallback onPressed) =>
      Positioned(
        bottom: 84,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
              elevation: 12,
              shape: StadiumBorder(),
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              color: Colors.black,
              onPressed: onPressed,
            ),
          ],
        ),
      );

  Widget buildText(String name, VoidCallback onTap) => Positioned(
        bottom: 32,
        right: 0,
        left: 0,
        child: InkWell(
          child: Text(
            name,
            textAlign: TextAlign.center,
          ),
          onTap: onTap,
        ),
      );
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Chats/index.dart';
import 'package:partyherd/widgets/CustomButton.dart';

class Login extends StatefulWidget {
  static const String route = "LOGIN";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser(BuildContext context) async {
    try {
      FirebaseUser user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Chats(
            user: user,
          ),
        ),
      );
    } catch (err) {
      print('Error in loginUser() : $err');
      final scaffold = Scaffold.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(err.message == null ? err.toString() : err.message),
          action: SnackBarAction(label: 'OKAY', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
              hintText: "Enter Your Email...",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              hintText: "Enter Your Password...",
              border: const OutlineInputBorder(),
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              return CustomButton(
                text: "Log In",
                callback: () async {
                  await loginUser(context);
                },
              );
            }
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:partyherd/actions/auth.dart';
import 'package:partyherd/reducers/index.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../Chats/index.dart';
import 'package:partyherd/widgets/CustomButton.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  static const String route = "LOGIN";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;

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
          StoreConnector<AppState, VoidCallback>(
            converter: (store) => () => store.dispatch(login(email, password)),
            builder: (context, login) {
              return CustomButton(
                text: "Log In",
                callback: login,
              );
            }
          ),
        ],
      ),
    );
  }
}

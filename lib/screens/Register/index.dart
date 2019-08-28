import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partyherd/widgets/CustomButton.dart';
import 'package:partyherd/screens/Chats/index.dart';

class Register extends StatefulWidget {
  static const String route = "REGISTER";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser(BuildContext context) async {
    try {
      FirebaseUser user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Chats(
            user: user,
          ),
        ),
      );
    } catch (err) {
      print('Error in registerUser() : $err');
      final scaffold = Scaffold.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(err.message),
          action: SnackBarAction(
              label: 'OKAY', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                text: "Register",
                callback: () async {
                  await registerUser(context);
                },
              );
            }
          ),
        ],
      ),
    );
  }
}

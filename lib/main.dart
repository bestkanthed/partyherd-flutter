import 'package:flutter/material.dart';
import 'screens/Home/index.dart';
import 'screens/Register/index.dart';
import 'screens/Chats/index.dart';
import 'screens/Login/index.dart';
import 'widgets/Auth.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'PartyHerd';

  @override
  void initState() {
    
  }

  @override
  Widget build(BuildContext context) {
    Auth _auth = Auth();
    return MaterialApp(
      title: _title,
      // home: MyStatefulWidget(),
      initialRoute: Login.route,
      routes: {
        // MyStatefulWidget.route: (context) => MyStatefulWidget(),
        Home.route: (context) => Home(),
        Register.route: (context) => Register(),
        Login.route: (context) => Login(),
        Chats.route: (context) => Chats(),
      },
    );
  }
}

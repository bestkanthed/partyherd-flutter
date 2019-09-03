import 'package:flutter/material.dart';
import 'package:partyherd/actions/index.dart';
import 'package:partyherd/reducers/index.dart';
import 'screens/Home/index.dart';
import 'screens/Register/index.dart';
import 'screens/Chats/index.dart';
import 'screens/Login/index.dart';
import 'widgets/Auth.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'models/User.dart';
import 'package:toast/toast.dart';

final Store<AppState> store = Store<AppState>(appStateReducer, middleware: [thunkMiddleware], initialState: AppState(null, null));


void main() {
  // final Store<AppState> store = Store<AppState>(appStateReducer, middleware: [thunkMiddleware], initialState: AppState(null, null));
  runApp(new MyApp());
}

// TODO: Show universal toast;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  // final Store<AppState> store;
  static const String _title = 'PartyHerd';

  // MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10000), () {
      Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    });
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, AppState>(
        onInit: (store) => store.dispatch(fetchLoggedInUser()),
        converter: (store) => store.state,
        builder: (context, state) {
          
          print('state called ${state.toast}');
          return MaterialApp(
            title: _title,
            // home: MyStatefulWidget(),
            // initial route must be chosen
            initialRoute: state.user == null ? Login.route : Home.route,
            routes: {
              // MyStatefulWidget.route: (context) => MyStatefulWidget(),
              Home.route: (context) => Home(),
              Register.route: (context) => Register(),
              Login.route: (context) => Login(),
              Chats.route: (context) => Chats(),
            },
          );
        },
      ),
    );
  }
}

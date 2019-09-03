import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import '../actions/index.dart';
import '../models/User.dart';

class AppState {
  User user;
  String toast;

  @override
  toString() {
    String userStringified = user.toString();
    return '{ user: $userStringified, toast: $toast }';
  }

  AppState(this.user, this.toast);
}

// Obviouly reducer listen to all the actions.
User userReducer(User previousState, dynamic action) {
  if (action is AuthFulfilled) {
    return action.user;
  } else if (action is LogoutFulfilled) {
    return null;
  } else {
    return previousState;
  }
}

String toastReducer(String previousState, dynamic action) {
  if (action is AuthRejected) {
    /*
    Fluttertoast.showToast(
      msg: action.error,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
    */
    return action.error;
  } /* else if (action is DecrementAction) {
    return CounterState(previousState.count - action.count);
  } */ else {
    return previousState;
  }
}

AppState appStateReducer(AppState state, action) {
  String appStateStringified = state.toString();
  print('printing action: $action, state: $appStateStringified');
  return AppState(
    userReducer(state.user, action),
    toastReducer(state.toast, action)
  );
}
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../reducers/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/User.dart';

final firebaseAuth = FirebaseAuth.instance;

class AuthFulfilled {
  User _user;
  User get user => _user;
  AuthFulfilled(this._user);
}

class LogoutFulfilled {}

class AuthRejected {
  String _error;
  String get error => _error;
  AuthRejected(this._error);
}

// Create a constructor for thunk actions
ThunkAction<AppState> login(String email, String password) {
  return (Store<AppState> store) async {
    try {
      FirebaseUser user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);  
      User databaseUser = new User(user.email, "Mumbai", "Gaps need to fuilled between this user and database user");
      store.dispatch(AuthFulfilled(databaseUser));
    } catch (err) {
      print('Error in registerUser() : $err');
      store.dispatch(AuthRejected(err.message));
    }
  };
}

ThunkAction<AppState> signup(String email, String password) {
  return (Store<AppState> store) async {
    try {
      FirebaseUser user = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);  
      User databaseUser = new User(user.email, "Mumbai", "Gaps need to fuilled between this user and databas user");
      store.dispatch(AuthFulfilled(databaseUser));
    } catch (err) {
      print('Error in registerUser() : $err');
      store.dispatch(AuthRejected(err.message));
    }
  };
}

ThunkAction<AppState> fetchLoggedInUser() {
  return (Store<AppState> store) async {
    try {
      FirebaseUser user = await firebaseAuth.currentUser();
      print('Printting user $user');
      if(user != null) {
        User databaseUser = new User(user.email, "Mumbai", "Gaps need to fuilled between this user and database user");
        store.dispatch(AuthFulfilled(databaseUser));
      } else store.dispatch(AuthFulfilled(null));
    } catch (err) {
      print('Error in registerUser() : $err');
      store.dispatch(AuthRejected(err.toString()));
    }
  };
}

ThunkAction<AppState> logout() {
  return (Store<AppState> store) async {
    try {
      await firebaseAuth.signOut();
      store.dispatch(LogoutFulfilled);
    } catch (err) {
      print('Error in registerUser() : $err');
      store.dispatch(AuthRejected(err.toString()));
    }
  };
}

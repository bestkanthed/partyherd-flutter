enum AuthActions {
  Signup, Login, Logout, 
}

class SignupAction {
  String email;
  String password;

  SignupAction(this.email, this.password);
}

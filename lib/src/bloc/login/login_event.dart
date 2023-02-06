import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitialEvent extends LoginEvent {
  LoginInitialEvent();

  @override
  List<Object> get props => [];
}

// Login
class SubmitLogin extends LoginEvent {
  final String phoneNumber;
  final String password;

  SubmitLogin({required this.phoneNumber, required this.password});

  @override
  List<Object> get props => [
        phoneNumber,
        password,
      ];
}

class Logout extends LoginEvent {
  Logout();

  @override
  List<Object> get props => [];
}

// Forgot password
class ForgotPassword extends LoginEvent {
  final String email;

  ForgotPassword({required this.email});

  @override
  List<Object> get props => [email];
}

import 'package:equatable/equatable.dart';

class LoginState {
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState with EquatableMixin {}

class LoginProcessing extends LoginState with EquatableMixin {}

class LoginSuccessState extends LoginState with EquatableMixin {
  final String username;

  LoginSuccessState({required this.username});
}

class LoginForgotPwdProcessing extends LoginState with EquatableMixin {}

class LoginForgotPwd extends LoginState with EquatableMixin {
  final String phoneNumber;

  LoginForgotPwd({required this.phoneNumber});
}

class LoginForgotPwdFail extends LoginState with EquatableMixin {
  final String error;
  LoginForgotPwdFail({required this.error});
}

class SendMailFail extends LoginState {}

class SendMailSuccess extends LoginState {}

class LoginFailState extends LoginState {
  final String title;
  final String error;

  LoginFailState({required this.title, required this.error});

  @override
  List<Object> get props => [title, error];
}

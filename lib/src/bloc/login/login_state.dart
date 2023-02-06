import 'package:equatable/equatable.dart';

class LoginState {
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState with EquatableMixin {}

class LoginProcessing extends LoginState with EquatableMixin {}

class LoginSuccess extends LoginState with EquatableMixin {
  final String phoneNumber;

  LoginSuccess({required this.phoneNumber});
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

class LoginFail extends LoginState {
  final String title;
  final String error;

  LoginFail({required this.title, required this.error});

  @override
  List<Object> get props => [this.title, this.error];
}

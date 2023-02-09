import 'package:equatable/equatable.dart';

class RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState with EquatableMixin {}

class RegisterProcessing extends RegisterState with EquatableMixin {}

class RegisterSuccessState extends RegisterState with EquatableMixin {}

class RegisterFailState extends RegisterState {
  final String title;
  final String error;

  RegisterFailState({required this.title, required this.error});

  @override
  List<Object> get props => [title, error];
}

class RegisterFailDupNumState extends RegisterState {
  RegisterFailDupNumState();

  @override
  List<Object> get props => [];
}

import 'package:equatable/equatable.dart';

class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterInitialEvent extends RegisterEvent {
  RegisterInitialEvent();

  @override
  List<Object> get props => [];
}

// Register
class SubmitRegister extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;
  final String dateOfBirth;

  SubmitRegister({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.password,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        phoneNumber,
        dateOfBirth,
        password,
      ];
}

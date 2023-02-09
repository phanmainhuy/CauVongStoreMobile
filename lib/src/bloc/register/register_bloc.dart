import 'package:bloc/bloc.dart';
import 'package:cauvongstore_mobile/src/bloc/register/register_event.dart';
import 'package:cauvongstore_mobile/src/bloc/register/register_state.dart';
import 'package:cauvongstore_mobile/src/services/network/user_store.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    switch (event.runtimeType) {
      case RegisterInitialEvent:
        break;
      case SubmitRegister:
        {
          SubmitRegister submitRegist = event as SubmitRegister;
          try {
            dynamic result = await doRegister(
              submitRegist.firstName,
              submitRegist.lastName,
              submitRegist.phoneNumber,
              submitRegist.password,
              submitRegist.dateOfBirth,
            );
            if (result == null) {
              yield RegisterFailState(
                  title: 'Register Failed',
                  error: result.toString()); // Stream Register is failed
            }
            if (result == 'REGISTER_SUCCESS') {
              print('Register_SUCCESS');
              yield RegisterSuccessState();
            } else if (result == 400) {
              print('REGISTER_FAIL_DUPLICATE_PHONENUM');
              yield RegisterFailDupNumState();
            } else {
              print('Register_INVALID_USER_PASSWORD');
              yield RegisterFailState(
                  title: 'Register Failed',
                  error: 'Register Failed'); // Stream Register is failed
            }
          } catch (e) {
            yield RegisterFailState(
                title: "Đăng ký tài khoản thất bại",
                error: e.toString()); // Stream Register is failed
          }
        }
        break;
    }
  }
}

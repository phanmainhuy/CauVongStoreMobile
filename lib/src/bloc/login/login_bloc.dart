import 'package:bloc/bloc.dart';
import 'package:cauvongstore_mobile/src/bloc/login/login_event.dart';
import 'package:cauvongstore_mobile/src/bloc/login/login_state.dart';
import 'package:cauvongstore_mobile/src/services/network/user_store.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    switch (event.runtimeType) {
      case LoginInitialEvent:
        break;
      case SubmitLogin:
        {
          SubmitLogin submitLogin = event as SubmitLogin;
          // yield LoginProcessing(); // Stream login is in progress
          try {
            dynamic result =
                await doLogin(submitLogin.username, submitLogin.password);
            if (result == null) {
              yield LoginFailState(
                  title: 'Login Failed',
                  error: result.toString()); // Stream login is failed
            }
            if (result == 'LOGIN_SUCCESS') {
              print('LOGIN_SUCCESS');
              yield LoginSuccessState(username: submitLogin.username);
            } else {
              print('LOGIN_INVALID_USER_PASSWORD');
              yield LoginFailState(
                  title: 'Login Failed',
                  error: 'Login Failed'); // Stream login is failed
            }
          } catch (e) {
            yield LoginFailState(
                title: "Login Failed",
                error: e.toString()); // Stream login is failed
          }
        }
        break;
      // case SubmitLogout:
      //   {
      //     yield LoginInitState();
      //   }
      //   break;
      // case ForgotPassword:
      //   {
      //     ForgotPassword forgotpwd = event as ForgotPassword;
      //     yield LoginForgotPwdProcessing();
      //     try {
      //       // Check invalid email
      //       Result rs;
      //       rs = mailAdressChecker(forgotpwd.phoneNumber);
      //       if (rs.status == false) {
      //         yield LoginFail(
      //             title: 'Login Failed', error: rs.errorMessage.toString());
      //       } else {
      //         dynamic result = await doForgot(forgotpwd.phoneNumber);

      //         if (result == API_RETURN_INTERNAL_SERVER_ERROR) {
      //           yield LoginForgotPwdDone();
      //           yield SendMailFail();
      //         } else if (result == API_RETURN_BAD_REQUEST) {
      //           yield LoginForgotPwdDone();
      //           yield LoginForgotPwdFail(
      //               error: $t("MSG_TOKEN_FORGOT_SEND_MAIL_FAILED"));
      //         } else if (result == API_RETURN_OK) {
      //           // Request ForgotPassword successfull
      //           print("SendMail");
      //           yield LoginForgotPwdDone();
      //           yield SendMailSuccess();
      //         }
      //       }
      //     } catch (e) {
      //       yield SendMailFail(); // Stream login is failed
      //     }

      //     yield LoginForgotPwd(phoneNumber: forgotpwd.phoneNumber);
      //   }
      //   break;
    }
  }
}

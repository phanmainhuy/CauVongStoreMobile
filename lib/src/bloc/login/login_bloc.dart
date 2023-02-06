import 'package:bloc/bloc.dart';
import 'package:cauvongstore_mobile/src/bloc/login/login_event.dart';
import 'package:cauvongstore_mobile/src/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());
  // @override
  // Stream<LoginState> mapEventToState(LoginEvent event) async* {
  //   switch (event.runtimeType) {
  //     case LoginInitialEvent:
  //       break;
  //     case SubmitLogin:
  //       {
  //         // ログイン認証処理
  //         SubmitLogin submitLogin = event as SubmitLogin;
  //         yield LoginProcessing(); // Stream login is in progress
  //         try {
  //           dynamic result = await doLogin(submitLogin.mailaddress,
  //               submitLogin.password, submitLogin.languagecode);

  //           if (result == $t("MSG_LOGIN_SUCCESS")) {
  //             // ダイアログが出てない時だけ読み取り
  //             yield LoginSuccess(mailaddress: submitLogin.mailaddress);
  //           } else {
  //             yield LoginFail(
  //                 title: 'エラー',
  //                 error: result.toString()); // Stream login is failed
  //           }
  //         } catch (e) {
  //           yield LoginFail(
  //               title: "エラー", error: e.toString()); // Stream login is failed
  //         }
  //       }
  //       break;
  //     case SubmitLogout:
  //       {
  //         yield LoginInitState();
  //       }
  //       break;
  //     case ForgotPassword:
  //       {
  //         ForgotPassword forgotpwd = event as ForgotPassword;
  //         yield LoginForgotPwdProcessing();
  //         try {
  //           // Check invalid email
  //           Result rs;
  //           rs = mailAdressChecker(forgotpwd.mailaddress);
  //           if (rs.status == false) {
  //             yield LoginFail(title: 'エラー', error: rs.errorMessage.toString());
  //           } else {
  //             dynamic result = await doForgot(forgotpwd.mailaddress);

  //             if (result == API_RETURN_INTERNAL_SERVER_ERROR) {
  //               yield LoginForgotPwdDone();
  //               yield SendMailFail();
  //             } else if (result == API_RETURN_BAD_REQUEST) {
  //               yield LoginForgotPwdDone();
  //               yield LoginForgotPwdFail(
  //                   error: $t("MSG_TOKEN_FORGOT_SEND_MAIL_FAILED"));
  //             } else if (result == API_RETURN_OK) {
  //               // Request ForgotPassword successfull
  //               print("SendMail");
  //               yield LoginForgotPwdDone();
  //               yield SendMailSuccess();
  //             }
  //           }
  //         } catch (e) {
  //           yield SendMailFail(); // Stream login is failed
  //         }

  //         yield LoginForgotPwd(mailaddress: forgotpwd.mailaddress);
  //       }
  //       break;
  //   }
  // }
}

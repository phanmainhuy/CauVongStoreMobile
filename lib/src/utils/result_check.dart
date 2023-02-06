class Result {
  int? code;
  bool? status;
  String? errorMessage;

  Result({this.code, this.status, this.errorMessage});
}

bool isValidEmail(input) {
  if (input.length <= 0) return true;
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(input);
}

bool isValidPass(String input) {
  if (input.length <= 0) return true;
  return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9]).{8,}$').hasMatch(input);
//  (?=.*[A-Z])       // should contain at least one upper case
//  (?=.*[a-z])       // should contain at least one lower case
//  (?=.*?[0-9])      // should contain at least one digit
// .{8,}              // Must be at least 8 characters in length
}

// メールアドレスチェック
bool emailChecker(String targetText) {
  return RegExp(r'[\w\-\._]+@[\w\-\._]+\.[A-Za-z]+').hasMatch(targetText);
}

// validate name
bool isValidName(String targetText) {
  return RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?~]').hasMatch(targetText);
}

Result mailAdressChecker(String mailAddress) {
  Result rs = Result();
  rs.status = true;
  if (mailAddress.isEmpty) {
    // rs.errorMessage = $t("MSG_EMAIL_IS_EMPTY");
    rs.status = false;
  } else if (!emailChecker(mailAddress)) {
    // rs.errorMessage = $t("MSG_FIELD_EMAIL");
    rs.status = false;
  }
  return rs;
}

Result passwordChecker(String password) {
  Result rs = Result();
  rs.status = true;
  if (password.isEmpty) {
    rs.errorMessage = "Loi";
    rs.status = false;
  }
  return rs;
}

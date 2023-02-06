import 'package:cauvongstore_mobile/src/resources/api.dart';
import 'package:cauvongstore_mobile/src/utils/result_check.dart';
import 'package:http/http.dart' as http;

Future<dynamic> doLogin(
    String email, String password, String languagecode) async {
  try {
    String url = '';
    String passSave = '';

    // Check invalid email
    Result rs;
    rs = mailAdressChecker(email);
    if (rs.status == false) {
      return rs.errorMessage;
    }
    rs = passwordChecker(password);
    if (rs.status == false) {
      return rs.errorMessage;
    }

    passSave = password;

    print('doLogin関数の呼び出し');

    // set url API SignIn
    url = API.postLogin;
    Uri uri = Uri.parse(url);

    //convert password to hash value
    //   var bytes = utf8.encode(password);
    //   var passhash = sha256.convert(bytes);
    //   print('password' + passhash.toString());
    //   String os = Platform.operatingSystem;
    //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //   String formedDeviceInfo;
    //   String strImei;
    //   String strDeviceToken = await localStorage.read(key: RES_DEVICE_TOKEN);

    //   if (os == 'ios') {
    //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    //     formedDeviceInfo =
    //         os + ' ' + iosInfo.systemVersion + ' ' + iosInfo.utsname.machine;
    //     strImei = iosInfo.identifierForVendor;
    //   } else {
    //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    //     formedDeviceInfo =
    //         os + ' ' + androidInfo.version.release + ' ' + androidInfo.device;
    //     strImei = androidInfo.androidId;
    //   }

    //   //create body of request
    //   var body = json.encode({
    //     'id': email,
    //     'password': password, // passhash.toString(),
    //     'language_code': languagecode,
    //   });

    //   LogUtil.logDebug(url);

    //   final response = await http.post(
    //     uri,
    //     body: body,
    //     headers: {
    //       RES_HEADER_API_KEY: API_KEY,
    //       'device-info': formedDeviceInfo,
    //       'Referer': REFERER,
    //       'imei': strImei,
    //       'device-token': strDeviceToken,
    //       'Cache-Control': 'no-cache, no-store',
    //       'Pragma': 'no-cache',
    //       'Expires': '0',
    //     },
    //   );

    //   LogUtil.logDebug(response.headers.toString());
    //   LogUtil.logDebug(response.body);
    //   LogUtil.logDebug(response.statusCode.toString());

    //   // String auth = response.headers['x-amzn-remapped-www-authenticate'];
    //   Map<String, dynamic> lstRes =
    //       new Map<String, dynamic>.from(json.decode(response.body));

    //   LogUtil.logDebug(lstRes);

    //   String emailBiometric = await localStorage.read(key: KEY_LOGINID_BIOMETRIC);

    //   if (response.statusCode == 200) {
    //     if (email != emailBiometric) {
    //       await localStorage.write(key: KEY_TOUCH_ID, value: "");
    //       await localStorage.write(key: KEY_FACE_ID, value: "");
    //     }

    //     int startTime = new DateTime.now().millisecondsSinceEpoch;
    //     await localStorage.write(key: KEY_LOGINID, value: email);
    //     await localStorage.write(key: KEY_USERID, value: lstRes['account_id']);
    //     await localStorage.write(
    //         key: KEY_USERNAME, value: lstRes['account_name']);
    //     await localStorage.write(key: KEY_IDTOKEN, value: lstRes['id_token']);
    //     await localStorage.write(key: CHECK_HEALTH, value: '');
    //     await localStorage.write(
    //         key: KEY_ACCESS_TOKEN, value: lstRes['access_token']);
    //     await localStorage.write(
    //         key: KEY_REFRESHTOKEN, value: lstRes['refresh_token']);
    //     await localStorage.write(key: KEY_VERSION, value: INSTALL_VERSION);
    //     await localStorage.write(
    //         key: KEY_START_TIME, value: startTime.toString());
    //     return $t("MSG_LOGIN_SUCCESS");
    //   } else if (response.statusCode == 404) {
    //     return $t("MSG_LOGIN_INVALID_USER_PASSWORD");
    //   } else if (response.statusCode == API_RETURN_NOT_ALLOWED) {
    //     return $t("MSG_MAINTENANCE_LOGIN");
    //   } else if (response.statusCode == 403) {
    //     return $t("MSG_LOGIN_LOCKING");
    //   } else {
    //     // If that response was not OK, throw an error.
    //     return $t("MSG_LOGIN_FAIL");
    //   }
  } catch (e) {
    print(e.toString());
    return e;
  }
}

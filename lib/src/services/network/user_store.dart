import 'dart:convert';

import 'package:cauvongstore_mobile/src/resources/api.dart';
import 'package:cauvongstore_mobile/src/resources/storage.dart';
import 'package:cauvongstore_mobile/src/utils/result_check.dart';
import 'package:http/http.dart' as http;

import '../../resources/key_local_storage.dart';

Future<dynamic> doLogin(String phoneNumber, String password) async {
  try {
    String url = '';
    String passSave = '';

    // Check invalid phoneNumber
    Result rs;
    rs = mailAdressChecker(phoneNumber);
    if (rs.status == false) {
      return rs.errorMessage;
    }
    rs = passwordChecker(password);
    if (rs.status == false) {
      return rs.errorMessage;
    }

    passSave = password;

    // set url API SignIn
    url = API.postLogin;
    Uri uri = Uri.parse(url);

    //convert password to hash v
    //   var bytes = utf8.encode(password);
    //   var passhash = sha256.convert(bytes);
    //   print('password' + passhash.toString());
    //   String os = Platform.operatingSystem;
    //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //   String formedDeviceInfo;
    //   String strImei;
    //   String strDeviceToken = await localStorage.read(key: RES_DEVICE_TOKEN);

    // if (os == 'ios') {
    //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    //   formedDeviceInfo =
    //       os + ' ' + iosInfo.systemVersion + ' ' + iosInfo.utsname.machine;
    //   strImei = iosInfo.identifierForVendor;
    // } else {
    //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    //   formedDeviceInfo =
    //       os + ' ' + androidInfo.version.release + ' ' + androidInfo.device;
    //   strImei = androidInfo.androidId;
    // }

    //create body of request
    var body = json.encode({
      'username': phoneNumber,
      'password': password, // passhash.toString(),
    });

    // print(url);

    final response = await http.post(
      uri,
      body: body,
    );

    print(response.statusCode.toString());
    print(response.body);

    String auth = response.headers['x-amzn-remapped-www-authenticate']!;
    Map<String, dynamic> lstRes =
        new Map<String, dynamic>.from(json.decode(response.body));

    print(lstRes);
    if (response.statusCode == 200) {
      int startTime = new DateTime.now().millisecondsSinceEpoch;
      await localStorage.write(
          key: KeyLocalStorage.keyPhoneNumber, value: phoneNumber);
      await localStorage.write(
          key: KeyLocalStorage.keyUserToken, value: lstRes['token']);
      await localStorage.write(
          key: KeyLocalStorage.keyUsername, value: phoneNumber);
      return 'LOGIN_SUCCESS';
    } else if (response.statusCode == APIStatus.apireturnUNAUTHORIZED) {
      return 'MSG_LOGIN_INVALID_USER_PASSWORD';
    } else if (response.statusCode == APIStatus.apireturnBADREQUEST) {
      return 'MAINTENANCE_LOGIN';
    } else {
      // If that response was not OK, throw an error.
      return 'LOGIN_FAIL';
    }
  } catch (e) {
    print(e.toString());
    return e;
  }
}

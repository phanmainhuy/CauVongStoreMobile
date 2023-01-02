// import 'package:cauvongstore_mobile/src/services/local/shared_prefs.dart';
import 'package:flutter/material.dart';

import 'src/application.dart';
import 'src/base/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Provider.debugCheckInvalidValueType = null;
  // await Firebase.initializeApp();
  setupLocator();
  // await locator<SharedPrefs>().setup();
  runApp(MyApp());
}

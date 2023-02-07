// import 'package:cauvongstore_mobile/src/services/local/shared_prefs.dart';
import 'package:cauvongstore_mobile/src/bloc/home/home_bloc.dart';
import 'package:cauvongstore_mobile/src/bloc/login/login_bloc.dart';
import 'package:cauvongstore_mobile/src/screen/home/home_page.dart';
import 'package:cauvongstore_mobile/src/screen/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/application.dart';
import 'src/base/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  // await Firebase.initializeApp();
  setupLocator();
  // await locator<SharedPrefs>().setup();
  runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(),
          child: LoginPage(),
        ),
        BlocProvider(
          create: (_) => HomeBloc(),
          child: HomePage(),
        ),
      ],
    ),
  );
}

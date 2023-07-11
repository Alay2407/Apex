import 'package:flutter/material.dart';
import 'package:shop_house/constants.dart';
import 'package:shop_house/preferences/pref_manager.dart';
import 'package:shop_house/routes/app_route.dart';
import 'package:shop_house/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefManager.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: appTheme(),
      initialRoute: AppRoute.splashScreen,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}

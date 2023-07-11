import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_house/screens/category_list/category_list_screen.dart';
import 'package:shop_house/screens/home/home_screen.dart';
import 'package:shop_house/screens/login/login_screen.dart';
import 'package:shop_house/screens/onboarding/on_boarding_screen.dart';
import 'package:shop_house/screens/splash/splash_screen.dart';

import '../screens/category/category_screen.dart';
import '../screens/signup/sign_up_screen.dart';

class AppRoute {
  static const splashScreen = '/';
  static const onBoardingScreen = '/onBoarding';
  static const loginScreen = '/login';
  static const signUpScreen = '/signUp';
  static const homeScreen = '/home';
  static const categoryListScreen = '/categoryList';
  static const categoryScreen = '/category';
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case signUpScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case categoryListScreen :
        return MaterialPageRoute(
          builder: (context) => CategoryListScreen(),
        );
      case categoryScreen :
        return MaterialPageRoute(
          builder: (context) => CategoryScreen(),
        );
    }
  }
}

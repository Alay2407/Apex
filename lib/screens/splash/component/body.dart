import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_house/constants.dart';
import 'package:shop_house/preferences/pref_manager.dart';
import 'package:shop_house/routes/app_route.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {

      if(PrefManager.getLoginStatus()){
        //true
        Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
      }else{

        //false
        //navigate to onboarding


        if(PrefManager.getVisitedStatus()){
          //navigate to loginpage
          Navigator.pushReplacementNamed(context, AppRoute.loginScreen);
        }
        else{
          //navigate to onboardingpage
          Navigator.pushReplacementNamed(context, AppRoute.onBoardingScreen);
        }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: kBackgroundGradient,
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/user.png',
            width: 140,
            height: 140,
          ),
        )
      ],
    );
  }
}

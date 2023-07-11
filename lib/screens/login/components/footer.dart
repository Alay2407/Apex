import 'package:flutter/material.dart';
import 'package:shop_house/routes/app_route.dart';

class LayoutFooter extends StatelessWidget {
  const LayoutFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.signUpScreen);
          },
          child: Text('Sign up'),
        ),
      ],
    );
  }
}

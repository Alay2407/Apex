import 'package:flutter/material.dart';
import 'package:shop_house/screens/signup/components/header.dart';
import 'package:shop_house/screens/signup/components/sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Center(

        child: Column(
          children: [
            AppBar(),
            LayoutHeader(),
            SizedBox(height: 24,),
            SignUpForm()
          ],
        ),
      ),
    );
  }
}

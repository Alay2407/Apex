import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_house/preferences/pref_manager.dart';
import 'package:shop_house/routes/app_route.dart';

import '../../../utils/utils.dart';

class SingInForm extends StatefulWidget {
  const SingInForm({super.key});

  @override
  State<SingInForm> createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {
  final _emailController = TextEditingController();
  final _passWordController = TextEditingController();

  String? errorEmail, errorPassword;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildEmailFormField(),
          SizedBox(
            height: 24,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: 24,
          ),
          buildForgotPasswordWidget(context),
          SizedBox(
            height: 24,
          ),
          buildLoginButtonWidget(),
        ],
      ),
    );
  }

  buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: "Email Address",
          errorText: errorEmail,
          floatingLabelBehavior: FloatingLabelBehavior.auto),
    );
  }

  buildPasswordFormField() {
    return TextFormField(
      controller: _passWordController,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: "Enter password",
          errorText: errorPassword,
          floatingLabelBehavior: FloatingLabelBehavior.auto),
    );
  }

  buildForgotPasswordWidget(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'Forger Password',
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  buildLoginButtonWidget() {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      color: Colors.green,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      onPressed: () {
        String email = _emailController.text.toString().trim();
        String password = _passWordController.text.toString().trim();

        resetError();
        if (!Utils.isValidEmail(email)) {
          //show error on email
          setState(() {
            errorEmail = 'Enter valid email address';
          });
        } else if (!Utils.isValidPassword(password)) {
          //show error msg on password
          setState(() {
            errorPassword = 'Enter valid password';
          });
        } else {

          // Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
          PrefManager.updateLoginStatus(true);
          //update share preference staus first then get satus .
          PrefManager.setLoginEmail(_emailController.text.toString());
          PrefManager.setLoginName(_passWordController.text.toString());
          Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
          print("All done");
        }
      },
      child: Text(
        'Sing in',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  void resetError() {
    setState(() {
      errorEmail = null;
      errorPassword = null;
    });
  }
}

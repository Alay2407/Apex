import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_house/components/custome_suffix_icon.dart';
import 'package:shop_house/constants.dart';
import 'package:shop_house/model/user.dart';
import 'package:shop_house/utils/utils.dart';

import '../../../preferences/pref_manager.dart';
import '../../../routes/app_route.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var gender = 'male';
  String dob = '',
      password = '',
      firstName = '',
      lastName = '',
      email = '',
      contact = '',
      userType = '',
      address = '';

  final _dobController = TextEditingController();
  final _passController = TextEditingController();

  void _updateGenderSelection(String? value) {
    setState(() {
      gender = value!;
    });
  }

  Future<void> _selectDate() async {
    var pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      dob =
          '${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}';

      setState(() {
        _dobController.text = dob;
      });
    }
  }

  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _globalKey,
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            buildNameFormField(),
            SizedBox(
              height: 16,
            ),
            buildEmailFormField(),
            SizedBox(
              height: 16,
            ),
            buildContactFormField(),
            SizedBox(
              height: 16,
            ),
            buildGenderSelectionWidget(),
            SizedBox(
              height: 16,
            ),
            buildUserTypeFormField(),
            SizedBox(
              height: 16,
            ),
            buildDateOfBirthFormField(context),
            SizedBox(
              height: 16,
            ),
            buildUserTypeFormField(),
            SizedBox(
              height: 16,
            ),
            buildAddressFormField(),
            SizedBox(
              height: 16,
            ),
            buildPasswordFormField(),
            SizedBox(
              height: 16,
            ),
            buildConfirmPasswordFormField(),
            SizedBox(
              height: 16,
            ),
            buildSignupButtonWidget(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  buildNameFormField() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              validator: (value) {
                if (value == null || value!.isEmpty) {
                  return "Enter first name";
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {
                firstName = newValue.toString();
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: "First Name",
                  hintText: "First Name",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: TextFormField(
              validator: (value) {
                if (value == null || value!.isEmpty) {
                  return "Enter last name";
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {
                lastName = newValue.toString();
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: "Last Name",
                  hintText: "Last Name",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
          ),
        ],
      ),
    );
  }

  buildEmailFormField() {
    return TextFormField(
      validator: (value) {
        if (value == null || !Utils.isValidEmail(value!)) {
          return "Enter valid email address";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        email = newValue.toString();
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Email Address",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffixIcon(iconEmail)),
    );
  }

  buildContactFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (value == null || !Utils.isValidContact(value!)) {
          return "Enter valid contact";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        contact = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "Contact",
          hintText: "Contact",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffixIcon(iconCall)),
    );
  }

  buildGenderSelectionWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Row(children: [
        Text('Gender'),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 'male',
                groupValue: gender,
                onChanged: (value) {
                  _updateGenderSelection(value);
                },
              ),
              Text('male'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 'female',
                groupValue: gender,
                onChanged: (value) {
                  _updateGenderSelection(value);
                },
              ),
              Text('female'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 'other',
                groupValue: gender,
                onChanged: (value) {
                  _updateGenderSelection(value);
                },
              ),
              Text('others'),
            ],
          ),
        ),
      ]),
    );
  }

  buildUserTypeFormField() {
    return DropdownButtonFormField(
      validator: (value) {
        if (value == null || value!.isEmpty) {
          return "select user type";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        userType = newValue.toString();
      },
      iconEnabledColor: Colors.black45,
      // onSaved: (newValue) {
      //   userType = newValue.toString();
      // },
      decoration: InputDecoration(
          labelText: "User type",
          hintText: "Select user type",
          floatingLabelBehavior: FloatingLabelBehavior.auto),
      items: [
        DropdownMenuItem(
          value: 'Vendor',
          child: Text("Vendor"),
        ),
        DropdownMenuItem(
          value: 'User',
          child: Text("User"),
        ),
      ],
      onChanged: (value) {
        userType = value.toString();
      },
    );
  }

  buildDateOfBirthFormField(BuildContext context) {
    return TextFormField(
      controller: _dobController,
      onTap: () {
        _selectDate();

        //here focus node used for not opening keyboard while we open datepicker dialog
        FocusScope.of(context).requestFocus(FocusNode());
      },
      validator: (value) {
        if (value == null || value!.isEmpty) {
          return "select date of birth";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        dob = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "Select Dob",
          hintText: "Select Dob",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffixIcon(iconCall)),
    );
  }

  buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      onSaved: (newValue) {
        address = newValue.toString();
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Address",
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildPasswordFormField() {
    return TextFormField(
      controller: _passController,
      validator: (value) {
        if (value == null || !Utils.isValidPassword(value!)) {
          return "Enter valid password";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        password = newValue.toString();
      },
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter Password",
          helperText:
              'Must contain digit,alphabet and special character(*,@,_)',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffixIcon(iconLock)),
    );
  }

  buildConfirmPasswordFormField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value != _passController.text.toString()) {
          return "Password mismatch";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: "Enter Password",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffixIcon(iconLock)),
    );
  }

  buildSignupButtonWidget() {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      color: Colors.green,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      onPressed: () {
        //Validate returns true if the form is valid, or false otherwise.
        if (_globalKey.currentState!.validate()) {
          _globalKey.currentState!.save();

          var user = User(
              address: address,
              name: '$firstName $lastName',
              contact: contact,
              dob: dob,
              email: email,
              gender: gender,
              password: password,
              userType: userType);
          print('''
          id:'${Random().nextInt(9999)}'
          Name : ${user.name} 
          contact: ${user.contact}
          address: ${user.address}
          password: ${user.password}
          userType: ${user.userType}
          email: ${user.email}
          dob:${user.dob}
          gender:${user.gender}
          ''');

          PrefManager.updateLoginStatus(true);
          //update share preference staus first then get satus .
          Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
        }
      },
      child: Text(
        'Sing Up',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

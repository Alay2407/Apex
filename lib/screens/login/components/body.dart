import 'package:flutter/material.dart';
import 'package:shop_house/screens/login/components/footer.dart';
import 'package:shop_house/screens/login/components/header.dart';
import 'package:shop_house/screens/login/components/sign_in_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          reverse: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: const IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    LayoutHeader(),
                    SizedBox(
                      height: 24,
                    ),
                    SingInForm(),
                    SizedBox(
                      height: 24,
                    ),
                    LayoutFooter(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}

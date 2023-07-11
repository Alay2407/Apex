import 'package:flutter/material.dart';
import 'package:shop_house/constants.dart';

class LayoutHeader extends StatelessWidget {
  const LayoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            'Register Account',
            style: headingStyle,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Comple your deatails or continue\nwith social media',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

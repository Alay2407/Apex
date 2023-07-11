import 'package:flutter/material.dart';
import 'package:shop_house/screens/home/components/header.dart';
import 'package:shop_house/screens/home/components/home_screen_drawer.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            LayoutHeader(),
          ],
        ),
      ),
    );
  }
}

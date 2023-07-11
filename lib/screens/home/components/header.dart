import 'package:flutter/material.dart';
import 'package:shop_house/components/custom_rounded_icon.dart';
import 'package:shop_house/components/search_field.dart';

class LayoutHeader extends StatelessWidget {
  const LayoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomRoundedIcon(
          iconData: Icons.menu,
          onPress: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(child: SearchField()),
        SizedBox(
          width: 10,
        ),
        CustomRoundedIcon(iconData: Icons.shopping_cart, onPress: () {}),
      ],
    );
  }
}

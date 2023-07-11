import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  String svgIcon;

  CustomSuffixIcon(this.svgIcon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        18,
        18,
        18,
      ),
      child: SvgPicture.asset(
        svgIcon,
        colorFilter: ColorFilter.mode(Colors.black45, BlendMode.srcIn),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meter_reading_app/core/app_color.dart';

class BaseDivider extends StatelessWidget {
  final double top, bottom;
  final Color? bgColor;

  const BaseDivider({
    super.key,
    this.top = 4,
    this.bottom = 4,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: top, bottom: bottom),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor ?? AppColor.themGraySoftLight,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/app_style.dart';

class LabelCardWidget extends StatelessWidget {
  final String label;
  const LabelCardWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(4).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          24,
        ).r,
        color: AppColor.themeGrayLight,
      ),
      child: Text(
        label,
        style: AppStyle.txtBody2,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/generated/fonts.gen.dart';

class AppStyle {
  AppStyle._();

  static TextStyle txtHeader1 = TextStyle(
    fontFamily: FontFamily.poppins,
    color: AppColor.themeTextColor,
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    height: 1.4.h,
  );

  static TextStyle txtHeader2 = TextStyle(
    fontFamily: FontFamily.poppins,
    color: AppColor.themeTextColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    height: 1.4.h,
  );

  static TextStyle txtHeader3 = TextStyle(
    fontFamily: FontFamily.poppins,
    color: AppColor.themeTextColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    height: 1.4.h,
  );

  static TextStyle txtBody = TextStyle(
    fontFamily: FontFamily.poppins,
    color: AppColor.themeTextColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    height: 1.5.h,
  );

  static TextStyle txtBody2 = TextStyle(
    fontFamily: FontFamily.poppins,
    color: AppColor.themeTextColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.5.h,
  );

  static TextStyle txtCaption = TextStyle(
    fontFamily: FontFamily.poppins,
    color: AppColor.themeTextColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    height: 1.33.h,
  );

  static TextStyle txtError = TextStyle(
    fontFamily: FontFamily.poppins,
    color: AppColor.errorColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    height: 1.33.h,
  );
}

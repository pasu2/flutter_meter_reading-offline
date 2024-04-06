import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/app_style.dart';

enum ButtonType { primary, secondary, tertiary, danger, success }

class BaseButton extends StatelessWidget {
  final ButtonType buttonType;
  final bool fitContent;
  final double? minWidth;
  final double? width;
  final Color? color;
  final double borderRadius;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final String? text;
  final Widget? iconWidget;
  final MainAxisAlignment rowMainAxisAlignment;
  final Color? txtColor;
  final EdgeInsets? margin;
  final bool isEnable;

  const BaseButton({
    Key? key,
    this.buttonType = ButtonType.primary,
    this.fitContent = true,
    this.minWidth,
    this.width,
    this.color,
    this.borderRadius = 8.0,
    required this.onTap,
    this.padding = const EdgeInsets.all(8.0),
    this.textStyle,
    this.text,
    this.iconWidget,
    this.rowMainAxisAlignment = MainAxisAlignment.center,
    this.txtColor,
    this.margin,
    this.isEnable = true,
  }) : super(key: key);

  Color _getBorderColor() {
    if (!isEnable) {
      return AppColor.themeGrayLight;
    }

    switch (buttonType) {
      case ButtonType.danger:
        return AppColor.errorColor;
      case ButtonType.tertiary:
        return AppColor.themePrimaryColor;
      case ButtonType.secondary:
        return AppColor.themeYellowColor;
      case ButtonType.success:
        return AppColor.themePrimaryColor;
      case ButtonType.primary:
      default:
        return AppColor.themePrimaryColor;
    }
  }

  Color _getButtonColor() {
    if (!isEnable) {
      return AppColor.themeGrayLight;
    }

    switch (buttonType) {
      case ButtonType.danger:
        return AppColor.errorColor;
      case ButtonType.tertiary:
        return AppColor.themeWhiteColor;
      case ButtonType.secondary:
        return AppColor.themeYellowColor;
      case ButtonType.success:
        return AppColor.themePrimaryColor;
      case ButtonType.primary:
      default:
        return AppColor.themePrimaryColor;
    }
  }

  Color _getButtonTextColor() {
    if (!isEnable) {
      return AppColor.themeWhiteColor;
    }

    switch (buttonType) {
      case ButtonType.danger:
        return AppColor.themeWhiteColor;
      case ButtonType.tertiary:
        return AppColor.themeTextColor;
      case ButtonType.secondary:
        return AppColor.themeWhiteColor;
      case ButtonType.primary:
      default:
        return AppColor.themeWhiteColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final minWidth = this.minWidth ?? 0;
    final width = this.width;
    final hasIcon = iconWidget != null;
    final hasText = text != null;

    return Container(
      constraints: fitContent
          ? BoxConstraints(
              minWidth: minWidth,
            )
          : null,
      width: width,
      margin: margin,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _getBorderColor(),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          color: color ?? _getButtonColor(),
        ),
        child: Material(
          color: color ?? _getButtonColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: InkWell(
            onTap: isEnable ? onTap : null,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Container(
              padding: padding,
              child: Row(
                mainAxisAlignment: rowMainAxisAlignment,
                children: [
                  if (hasIcon) ...[
                    iconWidget!,
                  ],
                  if (hasIcon && hasText) ...[
                    SizedBox(
                      width: 8.0.w,
                    ),
                  ],
                  if (hasText) ...[
                    Flexible(
                      child: FittedBox(
                        fit: fitContent ? BoxFit.contain : BoxFit.none,
                        child: Text(
                          text!,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle ??
                              AppStyle.txtBody2.copyWith(
                                color: _getButtonTextColor(),
                              ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

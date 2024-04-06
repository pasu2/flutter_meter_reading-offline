import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meter_reading_app/core/app_style.dart';
import 'package:meter_reading_app/generated/assets.gen.dart';

class BaseCounterWidget extends StatefulWidget {
  final Function(int digit) onUpdate;
  final int? initial;

  // พารามิเตอร์
  const BaseCounterWidget({
    super.key,
    required this.onUpdate,
    this.initial = 0,
  });

  @override
  _BaseCounterWidgetState createState() => _BaseCounterWidgetState();
}

class _BaseCounterWidgetState extends State<BaseCounterWidget> {
  int? _digit;

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;
    if (initial != null) {
      _digit = initial;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ปุ่มลบ
        GestureDetector(
          onTap: () {
            _digit ??= 0;

            if (_digit == null) return;

            if ((_digit ?? 0) < 9) {
              setState(() {
                _digit = (_digit ?? 0) + 1;
              });

              widget.onUpdate(_digit ?? 0);
            } else if ((_digit ?? 0) == 9) {
              setState(() {
                _digit = 0;
              });

              widget.onUpdate(_digit ?? 0);
            }
          },
          child: Assets.icons.icIncreaseBtn.svg(
            width: 24.w,
            height: 24.h,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          _digit == null ? '-' : '$_digit',
          style: AppStyle.txtBody.copyWith(fontSize: 24.sp),
        ),
        SizedBox(
          width: 8.w,
        ),
        // ปุ่มเพิ่ม
        GestureDetector(
          onTap: () {
            _digit ??= 0;

            if (_digit == null) return;

            if ((_digit ?? 0) > 0) {
              setState(() {
                _digit = (_digit ?? 0) - 1;
              });

              widget.onUpdate(_digit ?? 0);
            } else if ((_digit ?? 0) == 0) {
              setState(() {
                _digit = 9;
              });

              widget.onUpdate(_digit ?? 0);
            }
          },
          child: Assets.icons.icDecreaseBtn.svg(
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}

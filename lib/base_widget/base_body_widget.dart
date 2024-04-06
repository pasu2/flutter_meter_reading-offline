import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseBodyWidget extends StatelessWidget {
  final Widget? header;
  final Widget body;
  final Widget bottom;

  const BaseBodyWidget({
    super.key,
    this.header,
    required this.body,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (header != null) ...[
              header!,
            ],
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 8.0,
                  bottom: kBottomNavigationBarHeight,
                ).r,
                child: body,
              ),
            ),
          ],
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: bottom,
          ),
        ),
      ],
    );
  }
}

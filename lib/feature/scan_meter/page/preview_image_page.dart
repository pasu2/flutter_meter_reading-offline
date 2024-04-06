import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meter_reading_app/base_widget/base_app_bar.dart';
import 'package:meter_reading_app/base_widget/base_button.dart';
import 'package:meter_reading_app/base_widget/base_image_view.dart';
import 'package:meter_reading_app/base_widget/base_scaffold.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/widget/base_consumer_state.dart';
import 'package:meter_reading_app/feature/main/page/main_page.dart';
import 'package:meter_reading_app/feature/scan_meter/controller/image_processing_controller.dart';
import 'package:meter_reading_app/feature/scan_meter/page/meter_reading_page.dart';
import 'package:meter_reading_app/generated/assets.gen.dart';

class PreviewImagePage extends ConsumerStatefulWidget {
  static const routeName = "PreviewImagePage";

  const PreviewImagePage({super.key});

  @override
  _PreviewImagePageState createState() => _PreviewImagePageState();
}

class _PreviewImagePageState extends BaseConsumerState<PreviewImagePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              MainPage.routeName,
              (route) => false,
            );
          },
          icon: const Icon(
            Icons.home,
            color: Colors.black,
            size: 36.0,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Assets.imgs.imgBtnBack.image(),
            ),
          )
        ],
        bgColor: AppColor.themeSecondColor,
      ),
      bgColor: AppColor.themeSecondColor,
      bodyBuilder: (context, constrained) {
        final cropImgPath = ref.watch(imageProcessingControllerProvider
            .select((value) => value.cropImgPath));

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (cropImgPath != null) ...[
                BaseImageView(
                  file: File(cropImgPath),
                  width: 330.w,
                  height: 386.h,
                  fit: BoxFit.fill,
                  radius: BorderRadius.circular(24).r,
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
              BaseButton(
                onTap: () {
                  Navigator.of(context).pushNamed(MeterReadingPage.routeName);
                },
                text: 'Submit',
                buttonType: ButtonType.tertiary,
              ),
            ],
          ),
        );
      },
    );
  }
}

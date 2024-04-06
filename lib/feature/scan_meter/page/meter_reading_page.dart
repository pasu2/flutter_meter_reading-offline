import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meter_reading_app/base_widget/base_app_bar.dart';
import 'package:meter_reading_app/base_widget/base_image_view.dart';
import 'package:meter_reading_app/base_widget/base_scaffold.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/widget/base_consumer_state.dart';
import 'package:meter_reading_app/feature/history/widget/meter_reading_form_widget.dart';
import 'package:meter_reading_app/feature/main/page/main_page.dart';
import 'package:meter_reading_app/feature/scan_meter/controller/image_processing_controller.dart';
import 'package:meter_reading_app/generated/assets.gen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MeterReadingPage extends ConsumerStatefulWidget {
  static const routeName = "MeterReadingPage";

  const MeterReadingPage({super.key});

  @override
  _MeterReadingPageState createState() => _MeterReadingPageState();
}

class _MeterReadingPageState extends BaseConsumerState<MeterReadingPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final meterId = ref.watch(
          imageProcessingControllerProvider.select((value) => value.meterId));
      final meterReading = ref.watch(imageProcessingControllerProvider
          .select((value) => value.meterReading));
      ref.read(imageProcessingControllerProvider.notifier).setMeterId(meterId);
      ref
          .read(imageProcessingControllerProvider.notifier)
          .setMeterReading(meterReading);
    });
    super.initState();
  }

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

        final meterId = ref.watch(
            imageProcessingControllerProvider.select((value) => value.meterId));
        final meterReading = ref.watch(
          imageProcessingControllerProvider.select(
            (value) => value.meterReading,
          ),
        );

        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16).w,
                    child: BaseImageView(
                      file: cropImgPath != null ? File(cropImgPath) : null,
                      url: cropImgPath != null
                          ? null
                          : 'https://cdn2.vectorstock.com/i/1000x1000/48/06/image-preview-icon-picture-placeholder-vector-31284806.jpg',
                      width: 330.w,
                      height: 250.h,
                      radius: BorderRadius.circular(32).r,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Expanded(
                    child: MeterReadingFormWidget(
                      meterId: meterId,
                      meterReading: meterReading,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meter_reading_app/base_widget/base_app_bar.dart';
import 'package:meter_reading_app/base_widget/base_image_view.dart';
import 'package:meter_reading_app/base_widget/base_scaffold.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/widget/base_consumer_state.dart';
import 'package:meter_reading_app/feature/history/model/response/meter_reading_response.dart';
import 'package:meter_reading_app/feature/history/widget/meter_reading_form_widget.dart';
import 'package:meter_reading_app/feature/main/page/main_page.dart';
import 'package:meter_reading_app/generated/assets.gen.dart';

class HistoryDetailPageArgs {
  final MeterReadingResponse meterReadingResponse;
  final bool isEdit;

  HistoryDetailPageArgs({
    required this.meterReadingResponse,
    this.isEdit = false,
  });
}

class HistoryDetailPage extends ConsumerStatefulWidget {
  static const routeName = "HistoryDetailPage";
  final HistoryDetailPageArgs args;

  const HistoryDetailPage({
    super.key,
    required this.args,
  });

  @override
  _HistoryDetailPageState createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends BaseConsumerState<HistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    final meterReadingResponse = widget.args.meterReadingResponse;
    final isEdit = widget.args.isEdit;

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
                      file: File(meterReadingResponse.imgPath),
                      width: 350.w,
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
                      isEnable: false,
                      isEdit: isEdit,
                      meterImgPath: meterReadingResponse.imgPath,
                      id: meterReadingResponse.id,
                      meterReading: meterReadingResponse.meterReading,
                      meterId: meterReadingResponse.meterId,
                      isShowButton: isEdit,
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

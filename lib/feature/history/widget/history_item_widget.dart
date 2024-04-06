import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meter_reading_app/base_widget/base_button.dart';
import 'package:meter_reading_app/base_widget/base_dialog.dart';
import 'package:meter_reading_app/base_widget/base_image_view.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/app_style.dart';
import 'package:meter_reading_app/feature/history/controller/history_controller.dart';
import 'package:meter_reading_app/feature/history/model/response/meter_reading_response.dart';
import 'package:meter_reading_app/feature/history/page/history_detail_page.dart';
import 'package:meter_reading_app/feature/history/widget/label_card_widget.dart';

class HistoryItemWidget extends ConsumerWidget {
  final MeterReadingResponse meterReadingItem;

  const HistoryItemWidget({
    super.key,
    required this.meterReadingItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        color: AppColor.themeWhiteColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(4, 8), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (meterReadingItem.imgPath.isNotEmpty) ...[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  HistoryDetailPage.routeName,
                  arguments: HistoryDetailPageArgs(
                    meterReadingResponse: meterReadingItem,
                  ),
                );
              },
              child: BaseImageView(
                file: File(meterReadingItem.imgPath),
                width: 144.w,
                height: 159.h,
                radius: BorderRadius.circular(40).r,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      HistoryDetailPage.routeName,
                      arguments: HistoryDetailPageArgs(
                        meterReadingResponse: meterReadingItem,
                      ),
                    );
                  },
                  child: Text(
                    'METER READING',
                    style: AppStyle.txtBody2,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      HistoryDetailPage.routeName,
                      arguments: HistoryDetailPageArgs(
                        meterReadingResponse: meterReadingItem,
                      ),
                    );
                  },
                  child: LabelCardWidget(
                    label: meterReadingItem.meterReading,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      HistoryDetailPage.routeName,
                      arguments: HistoryDetailPageArgs(
                        meterReadingResponse: meterReadingItem,
                      ),
                    );
                  },
                  child: Text(
                    'METER ID',
                    style: AppStyle.txtBody2,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      HistoryDetailPage.routeName,
                      arguments: HistoryDetailPageArgs(
                        meterReadingResponse: meterReadingItem,
                      ),
                    );
                  },
                  child: LabelCardWidget(
                    label: meterReadingItem.meterId,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BaseButton(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            HistoryDetailPage.routeName,
                            arguments: HistoryDetailPageArgs(
                              meterReadingResponse: meterReadingItem,
                              isEdit: true,
                            ),
                          );
                        },
                        text: 'Edit',
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Expanded(
                      child: BaseButton(
                        buttonType: ButtonType.danger,
                        onTap: () async {
                          final _meterId = ref.watch(historyControllerProvider
                              .select((value) => value.meterId));
                          final _searchDate = ref.watch(
                            historyControllerProvider.select(
                              (value) => value.searchDate,
                            ),
                          );

                          await showDialog(
                              context: context,
                              builder: (_) {
                                return BaseDialog(
                                  message: 'ต้องการลบรายการนี้หรือไม่',
                                  text2: 'ยกเลิก',
                                  onClickSecond: () {
                                    Navigator.of(context).pop();
                                  },
                                  onClick: () async {
                                    Navigator.of(context).pop();

                                    final result = await ref
                                        .read(
                                            historyControllerProvider.notifier)
                                        .onDeleteMeterReading(
                                            meterReadingItem.id);

                                    if (result) {
                                      await ref
                                          .read(historyControllerProvider
                                              .notifier)
                                          .onGetHistory();

                                      ref
                                          .read(historyControllerProvider
                                              .notifier)
                                          .onSearchMeterId(
                                            _meterId ?? '',
                                            _searchDate,
                                          );

                                      Fluttertoast.showToast(
                                        msg: "ลบรายการเรียบร้อย",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: "ไม่สามารถลบรายการนี้ได้",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                      );
                                    }
                                  },
                                );
                              });
                        },
                        text: 'Delete',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

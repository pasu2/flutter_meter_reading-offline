import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meter_reading_app/base_widget/base_button.dart';
import 'package:meter_reading_app/base_widget/base_counter_widget.dart';
import 'package:meter_reading_app/base_widget/base_text_field.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/app_style.dart';
import 'package:meter_reading_app/core/widget/base_consumer_state.dart';
import 'package:meter_reading_app/feature/history/controller/history_controller.dart';
import 'package:meter_reading_app/feature/main/page/main_page.dart';
import 'package:meter_reading_app/feature/scan_meter/controller/image_processing_controller.dart';
import 'package:meter_reading_app/feature/scan_meter/page/confirm_meter_reading_page.dart';

class MeterReadingFormWidget extends ConsumerStatefulWidget {
  final bool isEnable;
  final String? meterImgPath;
  final String? meterReading;
  final bool isShowButton;
  final String? meterId;
  final bool isEdit;
  final String? id;
  final bool isSubmit;

  const MeterReadingFormWidget({
    super.key,
    this.meterImgPath,
    this.meterReading,
    this.meterId,
    this.isEnable = true,
    this.isEdit = false,
    this.isShowButton = true,
    this.isSubmit = false,
    this.id,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MeterReadingFormWidgetState createState() => _MeterReadingFormWidgetState();
}

class _MeterReadingFormWidgetState
    extends BaseConsumerState<MeterReadingFormWidget> {
  TextEditingController meterReadingController = TextEditingController();
  TextEditingController meterIdController = TextEditingController();
  int? meter1, meter2, meter3, meter4;

  @override
  void initState() {
    super.initState();
    meterIdController.text = widget.meterId ?? '';
    meterReadingController.text = widget.meterReading?.replaceAll(
          RegExp(r"\s+"),
          "",
        ) ??
        '';

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final meterReading = meterReadingController.text.split('');
      setState(() {
        if (meterReading.length == 4) {
          meter1 = int.parse(meterReading[0]);
          meter2 = int.parse(meterReading[1]);
          meter3 = int.parse(meterReading[2]);
          meter4 = int.parse(meterReading[3]);
        } else if (meterReading.length == 3) {
          meter2 = int.parse(meterReading[0]);
          meter3 = int.parse(meterReading[1]);
          meter4 = int.parse(meterReading[2]);
        } else if (meterReading.length == 2) {
          meter3 = int.parse(meterReading[0]);
          meter4 = int.parse(meterReading[1]);
        } else if (meterReading.length == 1) {
          meter4 = int.parse(meterReading[0]);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    meterReadingController.dispose();
    meterIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final meterId = meterIdController.text;
    final meterReading = meterReadingController.text;
    final id = widget.id;

    return Container(
      key: ValueKey((meter1 ?? meter2 ?? meter3 ?? meter4).hashCode),
      padding: const EdgeInsets.all(16).r,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
        color: AppColor.themePrimarySecondColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Text(
            'METER READING',
            style: AppStyle.txtHeader3,
          ),
          SizedBox(
            height: 4.h,
          ),
          if (widget.isEnable || widget.isEdit) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BaseCounterWidget(
                  initial: meter1,
                  onUpdate: (val) {
                    setState(() {
                      meter1 = val;
                    });
                  },
                ),
                SizedBox(
                  width: 16.w,
                ),
                BaseCounterWidget(
                  initial: meter2,
                  onUpdate: (val) {
                    setState(() {
                      meter2 = val;
                    });
                  },
                ),
                SizedBox(
                  width: 16.w,
                ),
                BaseCounterWidget(
                  initial: meter3,
                  onUpdate: (val) {
                    setState(() {
                      meter3 = val;
                    });
                  },
                ),
                SizedBox(
                  width: 16.w,
                ),
                BaseCounterWidget(
                  initial: meter4,
                  onUpdate: (val) {
                    setState(() {
                      meter4 = val;
                    });
                  },
                ),
              ],
            )
          ] else ...[
            BaseTextFormField(
              isEnabled: widget.isEnable || widget.isEdit,
              labelText: '',
              borderRadius: 16,
              filled: true,
              fillColor: widget.isEnable || widget.isEdit
                  ? AppColor.themeWhiteColor
                  : AppColor.themeGrayLight,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              controller: meterReadingController,
              onChanged: (val) {
                ref
                    .read(imageProcessingControllerProvider.notifier)
                    .setMeterReading(
                      val,
                    );
              },
            ),
          ],
          SizedBox(
            height: 8.h,
          ),
          Text(
            'METER ID',
            style: AppStyle.txtHeader3,
          ),
          SizedBox(
            height: 4.h,
          ),
          BaseTextFormField(
            isEnabled: widget.isEnable || widget.isEdit,
            labelText: '',
            borderRadius: 16,
            filled: true,
            fillColor: widget.isEnable || widget.isEdit
                ? AppColor.themeWhiteColor
                : AppColor.themeGrayLight,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: meterIdController,
            onChanged: (val) {
              ref
                  .read(imageProcessingControllerProvider.notifier)
                  .setMeterId(val);
            },
          ),
          if (widget.isShowButton) ...[
            SizedBox(
              height: 16.h,
            ),
            BaseButton(
              onTap: widget.isEdit
                  ? () async {
                      if (id == null ||
                          meterReading.isEmpty ||
                          meterId.isEmpty) {
                        Fluttertoast.showToast(
                          msg: "กรุณาระบุข้อมูลให้ถูกต้อง",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                        return;
                      }

                      final _meterId = ref.watch(historyControllerProvider
                          .select((value) => value.meterId));

                      final _searchDate = ref.watch(
                        historyControllerProvider.select(
                          (value) => value.searchDate,
                        ),
                      );

                      if (meter1 == null ||
                          meter2 == null ||
                          meter3 == null ||
                          meter4 == null) {
                        Fluttertoast.showToast(
                          msg: "กรุณาระบุข้อมูลให้ถูกต้อง",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                        return;
                      }

                      final result = await ref
                          .read(historyControllerProvider.notifier)
                          .onEditMeterReading(
                            id: id,
                            meterImgPath: widget.meterImgPath,
                            meterId: meterId,
                            meterReading: '$meter1$meter2$meter3$meter4',
                          );

                      await ref
                          .read(historyControllerProvider.notifier)
                          .onGetHistory();

                      ref
                          .read(historyControllerProvider.notifier)
                          .onSearchMeterId(_meterId ?? '', _searchDate);

                      if (result) {
                        Fluttertoast.showToast(
                          msg: "อัพเดทข้อมูลเรียบร้อย",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "อัพเดทข้อมูลไม่สำเร็จ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                      }
                    }
                  : () async {
                      if (!mounted) return;

                      if (meter1 == null ||
                          meter2 == null ||
                          meter3 == null ||
                          meter4 == null) {
                        Fluttertoast.showToast(
                          msg: "กรุณาระบุข้อมูลให้ถูกต้อง",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                        return;
                      }

                      ref
                          .read(imageProcessingControllerProvider.notifier)
                          .setMeterReading(
                            '$meter1$meter2$meter3$meter4',
                          );

                      if (widget.isSubmit) {
                        final result = await ref
                            .read(imageProcessingControllerProvider.notifier)
                            .onInsertMeterReading(
                                '$meter1$meter2$meter3$meter4');

                        if (result) {
                          if (!mounted) return;

                          Fluttertoast.showToast(
                            msg: "เพิ่มสำเร็จ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                          );

                          Navigator.of(context).pushNamedAndRemoveUntil(
                            MainPage.routeName,
                            (route) => false,
                          );
                        }
                      } else {
                        Navigator.of(context).pushNamed(
                          ConfirmMeterReadingPage.routeName,
                        );
                      }
                    },
              text: widget.isEdit
                  ? 'Edit'
                  : (widget.isSubmit ? 'Confirm' : 'Submit'),
              buttonType: ButtonType.tertiary,
            ),
          ],
        ],
      ),
    );
  }
}

import 'dart:io';
import 'dart:math';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:meter_reading_app/base_widget/base_button.dart';
import 'package:meter_reading_app/base_widget/base_date_picker_widget.dart';
import 'package:meter_reading_app/base_widget/base_text_field.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/app_style.dart';
import 'package:meter_reading_app/core/loader/loader_controller.dart';
import 'package:meter_reading_app/core/widget/base_consumer_state.dart';
import 'package:meter_reading_app/feature/history/controller/history_controller.dart';
import 'package:meter_reading_app/feature/history/extension/datetime_extension.dart';
import 'package:meter_reading_app/generated/assets.gen.dart';
import 'package:meter_reading_app/utils/util/date_format.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class ExportFormWidget extends ConsumerStatefulWidget {
  const ExportFormWidget({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ExportFormWidgetState createState() => _ExportFormWidgetState();
}

class _ExportFormWidgetState extends BaseConsumerState<ExportFormWidget> {
  TextEditingController exportFromController = TextEditingController();
  TextEditingController exportToController = TextEditingController();
  DateTime? dateFrom, dateTo;

  @override
  void initState() {
    super.initState();
    final currentDate = DateTime.now();
    exportFromController.text = ref
        .read(baseDateFormatterProvider)
        .formatDateWithFreeStyleFormat('dd-MM-yyyy', currentDate);
    exportToController.text = ref
        .read(baseDateFormatterProvider)
        .formatDateWithFreeStyleFormat('dd-MM-yyyy', currentDate);

    dateFrom = currentDate;
    dateTo = currentDate;
  }

  @override
  void dispose() {
    super.dispose();
    exportFromController.dispose();
    exportToController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final meterReadingList = ref.watch(
      historyControllerProvider.select(
        (value) => value.searchMeterReadingList,
      ),
    );

    return Container(
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
            height: 24.h,
          ),
          Text(
            'From',
            style: AppStyle.txtHeader3,
          ),
          SizedBox(
            height: 4.h,
          ),
          BaseTextFormField(
            labelText: '',
            borderRadius: 16,
            readOnly: true,
            filled: true,
            fillColor: AppColor.themeWhiteColor,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: exportFromController,
            suffixIcon: Assets.icons.icCalendar.svg(),
            onTap: () async {
              await BaseDatePicker.show(
                context: context,
                onSubmit: (submitDate) async {
                  dateFrom = submitDate?[0];
                  final isAfter = dateFrom!.date.isAfter(dateTo!.date);

                  if (isAfter) {
                    Fluttertoast.showToast(
                      msg: "เลือกวันไม่ถูกต้อง",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                  } else {
                    exportFromController.text = ref
                        .read(baseDateFormatterProvider)
                        .formatDateWithFreeStyleFormat(
                            'dd-MM-yyyy', submitDate![0]);
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'To',
            style: AppStyle.txtHeader3,
          ),
          SizedBox(
            height: 4.h,
          ),
          BaseTextFormField(
            readOnly: true,
            labelText: '',
            borderRadius: 16,
            filled: true,
            fillColor: AppColor.themeWhiteColor,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: exportToController,
            suffixIcon: Assets.icons.icCalendar.svg(),
            onTap: () async {
              await BaseDatePicker.show(
                context: context,
                onSubmit: (submitDate) async {
                  dateTo = submitDate?[0];

                  final isBefore = dateTo!.date.isBefore(dateFrom!.date);

                  if (isBefore) {
                    Fluttertoast.showToast(
                      msg: "เลือวันไม่ถูกต้อง",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                  } else {
                    exportToController.text = ref
                        .read(baseDateFormatterProvider)
                        .formatDateWithFreeStyleFormat(
                            'dd-MM-yyyy', submitDate![0]);
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          Align(
            alignment: Alignment.center,
            child: BaseButton(
              width: 100.w,
              onTap: () async {
                try {
                  if (dateFrom == null || dateTo == null) {
                    Fluttertoast.showToast(
                      msg: "ระบุวันที่ต้องการ Export",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                    return;
                  }

                  if (meterReadingList.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "ไม่มีข้อมูลสำหรับ Export",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                    return;
                  }

                  ref.read(loaderControllerProvider.notifier).onLoad();

                  // Create a new PDF document.
                  final PdfDocument document = PdfDocument();
                  // Add a new page to the document.
                  final PdfPage page = document.pages.add();
                  // Create a PDF grid class to add tables.
                  final PdfGrid grid = PdfGrid();
                  // Specify the grid column count.
                  grid.columns.add(count: 4);
                  // Add a grid header row.
                  final PdfGridRow headerRow = grid.headers.add(1)[0];
                  headerRow.cells[0].value = 'Image';
                  headerRow.cells[1].value = 'Meter Reading';
                  headerRow.cells[2].value = 'Meter ID';
                  headerRow.cells[3].value = 'Created Date';

                  // Set header font.
                  headerRow.style.font = PdfStandardFont(
                      PdfFontFamily.helvetica, 10,
                      style: PdfFontStyle.bold);
                  // Add rows to the grid.

                  for (final item in meterReadingList) {
                    final createdAt = item.createAt;
                    final isAfter = createdAt.date == dateFrom!.date ||
                        createdAt.isAfter(dateFrom!);
                    final isBefore = createdAt.date == dateTo!.date ||
                        createdAt.isBefore(dateTo!);

                    if (isBefore && isAfter) {
                      PdfGridRow row = grid.rows.add();
                      final imgPath = item.imgPath;
                      row.cells[0].value = PdfBitmap(
                        File(imgPath).readAsBytesSync(),
                      );
                      row.cells[1].value = item.meterReading;
                      row.cells[2].value = item.meterId;
                      row.cells[3].value = ref
                          .read(baseDateFormatterProvider)
                          .formatDateWithFreeStyleFormat(
                            'dd MM yyyy',
                            item.createAt,
                          );
                    }
                  }

                  // Set grid format.
                  grid.style.cellPadding = PdfPaddings(left: 5, top: 5);

                  // Draw table in the PDF page.
                  grid.draw(
                      page: page,
                      bounds: Rect.fromLTWH(0, 0, page.getClientSize().width,
                          page.getClientSize().height));

                  final path =
                      await ExternalPath.getExternalStoragePublicDirectory(
                    ExternalPath.DIRECTORY_DOWNLOADS,
                  );

                  // Save the document.
                  File('$path/meterreading_${Random().nextInt(100)}.pdf')
                      .writeAsBytes(await document.save());
                  // Dispose the document.
                  document.dispose();
                  ref.read(loaderControllerProvider.notifier).onDismissLoad();
                  Fluttertoast.showToast(
                    msg: "ดาวน์โหลดสำเร็จ",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                } catch (e) {
                  print(e);
                }
              },
              text: 'Export',
              buttonType: ButtonType.primary,
            ),
          ),
        ],
      ),
    );
  }
}

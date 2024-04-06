import 'package:flutter/material.dart';
import 'package:meter_reading_app/base_widget/base_button.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/app_style.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BaseDatePicker {
  static Future<void> show({
    required BuildContext context,
    List<DateTime>? initialSelectedDates,
    DateTime? initialSelectedDate,
    void Function(DateRangePickerSelectionChangedArgs)? onSelectionChanged,
    required void Function(List<DateTime>?) onSubmit,
    bool Function(DateTime date)? selectableDayPredicate,
    bool isMultiSelected = false,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return BaseDatePickerDialog(
          initialSelectedDates: initialSelectedDates,
          initialSelectedDate: initialSelectedDate,
          isMultiSelected: isMultiSelected,
          onSubmit: onSubmit,
          onSelectionChanged: onSelectionChanged,
          selectableDayPredicate: selectableDayPredicate,
        );
      },
    );
  }
}

class BaseDatePickerDialog extends StatefulWidget {
  final List<DateTime>? initialSelectedDates;
  final void Function(DateRangePickerSelectionChangedArgs)? onSelectionChanged;
  final void Function(List<DateTime>?) onSubmit;
  final bool Function(DateTime date)? selectableDayPredicate;
  final bool isMultiSelected;
  final DateTime? initialSelectedDate;

  const BaseDatePickerDialog({
    Key? key,
    this.initialSelectedDates,
    this.onSelectionChanged,
    required this.onSubmit,
    this.selectableDayPredicate,
    this.isMultiSelected = false,
    this.initialSelectedDate,
  }) : super(key: key);

  @override
  _BaseDatePickerDialogState createState() => _BaseDatePickerDialogState();
}

class _BaseDatePickerDialogState extends State<BaseDatePickerDialog> {
  final DateRangePickerController controller = DateRangePickerController();

  // Color selectedDateBgColor = AppColor.themeOrangeColor;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final minDate = DateTime(currentYear, 1, 1);
    final maxDate = DateTime(currentYear + 1, 12, 31, 23, 59, 59);

    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      insetPadding: const EdgeInsets.all(16.0),
      actionsPadding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      actions: [
        SizedBox(
          width: 80,
          child: BaseButton(
            text: 'cancel',
            textStyle: AppStyle.txtBody2.copyWith(
              color: Colors.black,
            ),
            buttonType: ButtonType.tertiary,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(
          width: 80,
          child: BaseButton(
            text: 'OK',
            textStyle: AppStyle.txtBody2.copyWith(
              color: Colors.black,
            ),
            buttonType: ButtonType.primary,
            onTap: () {
              widget.onSubmit(
                widget.isMultiSelected
                    ? controller.selectedDates
                    : [controller.selectedDate!],
              );
              Navigator.pop(context);
            },
          ),
        ),
      ],
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: SfDateRangePicker(
          selectionShape: DateRangePickerSelectionShape.circle,
          controller: controller,
          initialSelectedDates: widget.initialSelectedDates,
          onSelectionChanged: widget.onSelectionChanged,
          selectionColor: AppColor.themePrimaryColor,
          todayHighlightColor: AppColor.themePrimaryColor,
          selectionMode: widget.isMultiSelected
              ? DateRangePickerSelectionMode.multiple
              : DateRangePickerSelectionMode.single,
          showNavigationArrow: true,
          selectableDayPredicate: widget.selectableDayPredicate,
          initialSelectedDate: widget.initialSelectedDate ?? DateTime.now(),
          initialDisplayDate:
              (widget.initialSelectedDates?[0] ?? widget.initialSelectedDate) ??
                  DateTime.now(),
          // minDate: minDate,
          // maxDate: maxDate,
          monthFormat: 'MMM',
          selectionTextStyle: AppStyle.txtBody2.copyWith(
            color: Colors.black,
          ),
          headerStyle: DateRangePickerHeaderStyle(
            textStyle: AppStyle.txtBody2,
          ),
          monthViewSettings: DateRangePickerMonthViewSettings(
            weekendDays: const [6, 7],
            viewHeaderHeight: 60,
            viewHeaderStyle: DateRangePickerViewHeaderStyle(
              textStyle: AppStyle.txtBody2,
            ),
          ),
          monthCellStyle: DateRangePickerMonthCellStyle(
            weekendTextStyle: AppStyle.txtBody2,
            leadingDatesTextStyle: AppStyle.txtBody2,
            textStyle: AppStyle.txtBody2,
            disabledDatesTextStyle:
                AppStyle.txtBody2.copyWith(color: AppColor.themeGrayLight),
            todayTextStyle: AppStyle.txtBody2.copyWith(
              color: AppColor.themePrimaryColor,
            ),
            todayCellDecoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.themePrimaryColor,
              ),
            ),
          ),
          yearCellStyle: DateRangePickerYearCellStyle(
            textStyle: AppStyle.txtBody2,
            todayTextStyle: AppStyle.txtBody2.copyWith(
              color: AppColor.themePrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

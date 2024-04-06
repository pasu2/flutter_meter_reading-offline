import 'dart:io';
import 'dart:math';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:meter_reading_app/base_widget/base_app_bar.dart';
import 'package:meter_reading_app/base_widget/base_scaffold.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/app_style.dart';
import 'package:meter_reading_app/core/loader/loader_controller.dart';
import 'package:meter_reading_app/core/widget/base_consumer_state.dart';
import 'package:meter_reading_app/feature/history/controller/history_controller.dart';
import 'package:meter_reading_app/feature/history/widget/export_form_widget.dart';
import 'package:meter_reading_app/feature/history/widget/history_list_widget.dart';
import 'package:meter_reading_app/feature/main/page/main_page.dart';
import 'package:meter_reading_app/generated/assets.gen.dart';
import 'package:meter_reading_app/utils/util/date_format.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class ExportFilterPage extends ConsumerStatefulWidget {
  static const routeName = "ExportFilterPage";

  const ExportFilterPage({super.key});

  @override
  _ExportFilterPageState createState() => _ExportFilterPageState();
}

class _ExportFilterPageState extends BaseConsumerState<ExportFilterPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        isCenterTitle: true,
        title: Text(
          'Export',
          style: AppStyle.txtHeader3,
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
        hideBackButton: true,
        bgColor: AppColor.themeSecondColor,
      ),
      bgColor: AppColor.themeSecondColor,
      bodyBuilder: (context, constrained) {
        return const ExportFormWidget();
      },
    );
  }
}

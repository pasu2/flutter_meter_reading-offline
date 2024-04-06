import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meter_reading_app/feature/history/controller/history_controller.dart';
import 'package:meter_reading_app/feature/history/page/history_detail_page.dart';
import 'package:meter_reading_app/feature/history/widget/history_item_widget.dart';

class HistoryListWidget extends ConsumerWidget {
  const HistoryListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meterReadingList = ref.watch(
      historyControllerProvider.select(
        (value) => value.searchMeterReadingList,
      ),
    );

    if (meterReadingList.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: meterReadingList.length,
      itemBuilder: (context, index) {
        final meterReadingItem = meterReadingList[index];

        return HistoryItemWidget(
          meterReadingItem: meterReadingItem,
        );
      },
      separatorBuilder: (_, __) => SizedBox(
        height: 16.h,
      ),
    );
  }
}

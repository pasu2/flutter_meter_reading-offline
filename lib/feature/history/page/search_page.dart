import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meter_reading_app/base_widget/base_app_bar.dart';
import 'package:meter_reading_app/base_widget/base_button.dart';
import 'package:meter_reading_app/base_widget/base_date_picker_widget.dart';
import 'package:meter_reading_app/base_widget/base_scaffold.dart';
import 'package:meter_reading_app/base_widget/base_text_field.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/widget/base_consumer_state.dart';
import 'package:meter_reading_app/feature/history/controller/history_controller.dart';
import 'package:meter_reading_app/feature/history/page/histories_page.dart';
import 'package:meter_reading_app/feature/main/page/main_page.dart';
import 'package:meter_reading_app/generated/assets.gen.dart';
import 'package:meter_reading_app/utils/util/date_format.dart';

class SearchPage extends ConsumerStatefulWidget {
  static const routeName = "SearchPage";

  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends BaseConsumerState<SearchPage> {
  TextEditingController searchController = TextEditingController();
  DateTime? searchDate;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(historyControllerProvider.notifier).onGetHistory();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _searchDate = ref.watch(
      historyControllerProvider.select(
        (value) => value.searchDate,
      ),
    );

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
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        bgColor: AppColor.themePrimaryColor,
      ),
      bgColor: AppColor.themePrimaryColor,
      bodyBuilder: (context, constrained) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.imgs.logoBanner.image(),
                SizedBox(
                  height: 24.h,
                ),
                BaseTextFormField(
                  labelText: '',
                  hintText: 'Search METER ID or Date',
                  borderRadius: 32,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 42.0,
                  ),
                  suffixIcon: GestureDetector(
                    child: Assets.icons.icCalendar.svg(),
                    onTap: () async {
                      await BaseDatePicker.show(
                        context: context,
                        initialSelectedDate: searchDate ?? _searchDate,
                        onSubmit: (submitDate) async {
                          searchController.text = ref
                              .read(baseDateFormatterProvider)
                              .formatDateWithFreeStyleFormat(
                                  'dd-MM-yyyy', submitDate![0]);

                          setState(() {
                            searchDate = submitDate[0];
                          });
                        },
                      );
                    },
                  ),
                  onChanged: (val) {
                    if (searchDate != null) {
                      setState(() {
                        searchDate = null;
                      });
                    }
                  },
                  filled: true,
                  fillColor: AppColor.themeWhiteColor,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: searchController,
                ),
                SizedBox(
                  height: 16.h,
                ),
                BaseButton(
                  onTap: () async {
                    ref
                        .read(historyControllerProvider.notifier)
                        .onClearMeterId();

                    await ref
                        .read(historyControllerProvider.notifier)
                        .onGetHistory();

                    ref
                        .read(historyControllerProvider.notifier)
                        .onSearchMeterId(searchController.text, searchDate);

                    Navigator.of(context).pushNamed(HistoriesPage.routeName);
                  },
                  borderRadius: 24.0,
                  text: 'Search',
                  buttonType: ButtonType.tertiary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

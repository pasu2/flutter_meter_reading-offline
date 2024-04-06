import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meter_reading_app/base_widget/base_button.dart';
import 'package:meter_reading_app/base_widget/base_scaffold.dart';
import 'package:meter_reading_app/core/app_color.dart';
import 'package:meter_reading_app/core/application/custom_platform.dart';
import 'package:meter_reading_app/core/widget/base_consumer_state.dart';
import 'package:meter_reading_app/feature/history/page/search_page.dart';
import 'package:meter_reading_app/feature/scan_meter/page/camera_scan_page.dart';
import 'package:meter_reading_app/feature/scan_meter/page/meter_reading_page.dart';
import 'package:meter_reading_app/feature/scan_meter/page/preview_image_page.dart';
import 'package:meter_reading_app/generated/assets.gen.dart';
import 'package:meter_reading_app/utils/util/base_permission_handler.dart';

class MainPage extends ConsumerStatefulWidget {
  static const routeName = "MainPage";

  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends BaseConsumerState<MainPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref
          .read(basePermissionHandlerProvider)
          .requestSaveImagePermission();
      await ref.read(basePermissionHandlerProvider).requestStoragePermission();

      final androidAPILevel = await CustomPlatform.androidAPILevel();
      if (androidAPILevel >= 9) {
        await ref.read(basePermissionHandlerProvider).requestPhotosPermission();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      bgColor: AppColor.themePrimaryColor,
      bodyBuilder: (context, constrained) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.imgs.logoBanner.image(),
              SizedBox(
                height: 16.h,
              ),
              BaseButton(
                onTap: () {
                  Navigator.of(context).pushNamed(CameraScanPage.routeName);
                },
                borderRadius: 24.0,
                text: 'SCAN',
                buttonType: ButtonType.tertiary,
              ),
              SizedBox(
                height: 24.h,
              ),
              BaseButton(
                onTap: () {
                  Navigator.of(context).pushNamed(SearchPage.routeName);
                },
                borderRadius: 24.0,
                text: 'HISTORY',
                buttonType: ButtonType.tertiary,
              ),
            ],
          ),
        );
      },
    );
  }
}

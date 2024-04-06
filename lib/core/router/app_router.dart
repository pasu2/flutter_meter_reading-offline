import 'package:flutter/material.dart';
import 'package:meter_reading_app/core/router/custom_page_route_builder.dart';
import 'package:meter_reading_app/feature/history/page/export_filter_page.dart';
import 'package:meter_reading_app/feature/history/page/histories_page.dart';
import 'package:meter_reading_app/feature/history/page/history_detail_page.dart';
import 'package:meter_reading_app/feature/history/page/search_page.dart';
import 'package:meter_reading_app/feature/main/page/main_page.dart';
import 'package:meter_reading_app/feature/scan_meter/page/camera_scan_page.dart';
import 'package:meter_reading_app/feature/scan_meter/page/confirm_meter_reading_page.dart';
import 'package:meter_reading_app/feature/scan_meter/page/meter_reading_page.dart';
import 'package:meter_reading_app/feature/scan_meter/page/preview_image_page.dart';

class AppRouter {
  static const initialRouterName = MainPage.routeName;

  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case MainPage.routeName:
        return CustomPageRouteBuilder.route(
          name: MainPage.routeName,
          builder: (ctx) => const MainPage(),
          transitionType: RouteTransition.fade,
        );

      case SearchPage.routeName:
        return CustomPageRouteBuilder.route(
          name: SearchPage.routeName,
          builder: (ctx) => const SearchPage(),
          transitionType: RouteTransition.fade,
        );

      case HistoriesPage.routeName:
        return CustomPageRouteBuilder.route(
          name: HistoriesPage.routeName,
          builder: (ctx) => const HistoriesPage(),
          transitionType: RouteTransition.fade,
        );

      case HistoryDetailPage.routeName:
        assert(
          settings.arguments is HistoryDetailPageArgs ||
              settings.arguments == null,
          'arguments must be HistoryDetailPageArgs or null',
        );

        final args = settings.arguments as HistoryDetailPageArgs;

        return CustomPageRouteBuilder.route(
          name: HistoryDetailPage.routeName,
          builder: (ctx) => HistoryDetailPage(args: args),
          transitionType: RouteTransition.fade,
        );

      case CameraScanPage.routeName:
        return CustomPageRouteBuilder.route(
          name: CameraScanPage.routeName,
          builder: (ctx) => const CameraScanPage(),
          transitionType: RouteTransition.fade,
        );

      case PreviewImagePage.routeName:
        return CustomPageRouteBuilder.route(
          name: PreviewImagePage.routeName,
          builder: (ctx) => const PreviewImagePage(),
          transitionType: RouteTransition.fade,
        );

      case MeterReadingPage.routeName:
        return CustomPageRouteBuilder.route(
          name: MeterReadingPage.routeName,
          builder: (ctx) => const MeterReadingPage(),
          transitionType: RouteTransition.fade,
        );

      case ExportFilterPage.routeName:
        return CustomPageRouteBuilder.route(
          name: ExportFilterPage.routeName,
          builder: (ctx) => const ExportFilterPage(),
          transitionType: RouteTransition.fade,
        );

      case ConfirmMeterReadingPage.routeName:
        return CustomPageRouteBuilder.route(
          name: ConfirmMeterReadingPage.routeName,
          builder: (ctx) => const ConfirmMeterReadingPage(),
          transitionType: RouteTransition.fade,
        );

      // case RoomAndRateScreen.routeName:
      //   assert(
      //     settings.arguments is RoomAndRateScreenArgs ||
      //         settings.arguments == null,
      //     'arguments must be RoomAndRateScreenArgs or null',
      //   );

      //   final args = settings.arguments as RoomAndRateScreenArgs;

      //   return CustomPageRouteBuilder.route(
      //     name: RoomAndRateScreen.routeName,
      //     builder: (ctx) => RoomAndRateScreen(
      //       args: args,
      //     ),
      //     transitionType: RouteTransition.slideVertically,
      //   );

      default:
        assert(false, 'this should not be reached');
        return null;
    }
  }
}

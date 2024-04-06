import 'package:flutter/material.dart';
import 'package:meter_reading_app/core/app_color.dart';

// implement this one as dialog
// showBaseDialog(
//               context: context,
//               builder: (ctx) {
//                 return const LoadingDialogModal();
//               },
//             );

class LoadingDialogModal extends StatefulWidget {
  final Color backdropColor;

  const LoadingDialogModal({
    Key? key,
    this.backdropColor = Colors.transparent,
  }) : super(key: key);

  static Widget asyncLoading({
    Color? backdropColor,
    bool? isLoading,
  }) {
    return isLoading == false
        ? const SizedBox(
            height: 0,
            width: 0,
          )
        : LoadingDialogModal(
            backdropColor:
                backdropColor ?? AppColor.themeGrayLight.withOpacity(0.5),
          );
  }

  @override
  _LoadingDialogModalState createState() => _LoadingDialogModalState();
}

class _LoadingDialogModalState extends State<LoadingDialogModal> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: WillPopScope(
        onWillPop: () async => false,
        child: AbsorbPointer(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            color: widget.backdropColor,
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

// Dialog
mixin BaseLoadingDialog {
  Future<T?> showBaseLoadingDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: AppColor.themeGrayLight.withOpacity(0.4),
      barrierDismissible: barrierDismissible,
      builder: (_) => const AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: LoadingDialogModal(
          backdropColor: Colors.transparent,
        ),
      ),
    );
  }
}

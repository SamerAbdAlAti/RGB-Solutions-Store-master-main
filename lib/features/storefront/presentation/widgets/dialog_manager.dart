import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class DialogManager {
  static void warningDialog(
      {required BuildContext context,
      required String description,
      required String title}) {
    MotionToast.warning(
      title: Text(title),
      description: Text(description),
      position: MotionToastPosition.bottom,
      dismissable: true,
      layoutOrientation: ToastOrientation.rtl,
      animationDuration: const Duration(milliseconds: 400),
      borderRadius: 10,
      enableAnimation: true,
      animationType: AnimationType.fromRight,
      animationCurve: Curves.ease,
    ).show(context);
  }

  static void errorDialog(
      {required BuildContext context,
      required String description,
      required String title}) {
    MotionToast.error(
      title: Text(title),
      description: Text(description),
      position: MotionToastPosition.bottom,
      layoutOrientation: ToastOrientation.rtl,
      animationDuration: const Duration(milliseconds: 400),
      borderRadius: 10,
      enableAnimation: true,
      animationType: AnimationType.fromRight,
      animationCurve: Curves.ease,
    ).show(context);
  }

  static void successDialog(
      {required BuildContext context,
      required String message,
      required String title}) {
    final materialBanner = MaterialBanner(
      elevation: 0,
      onVisible: () async {
        await Future.delayed(const Duration(seconds: 1));
        if (context.mounted) {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        }
      },
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: title,
        contentType: ContentType.success,
        inMaterialBanner: true,
        message: message,
      ),
      actions: const [SizedBox.shrink()],
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(materialBanner);
  }
}

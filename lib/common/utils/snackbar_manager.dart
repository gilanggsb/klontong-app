import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common.dart';

class SnackbarManager {
  static void showSuccessSnackbar({
    required String message,
    Duration duration = const Duration(seconds: 2),
    BuildContext? context,
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: Colors.green,
      iconData: Icons.check_circle,
      duration: duration,
    );
  }

  static void showWarningSnackbar({
    required String message,
    Duration duration = const Duration(seconds: 2),
    BuildContext? context,
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: Colors.orange,
      iconData: Icons.warning,
      duration: duration,
    );
  }

  static void showErrorSnackbar({
    required String message,
    Duration duration = const Duration(seconds: 2),
    BuildContext? context,
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: Colors.red,
      iconData: Icons.error,
      duration: duration,
    );
  }

  static void showInfoSnackbar({
    required String message,
    Duration duration = const Duration(seconds: 2),
    BuildContext? context,
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: Colors.grey.shade700,
      iconData: Icons.error,
      duration: duration,
    );
  }

  static void showCustomSnackbar({
    required String message,
    required Color backgroundColor,
    required IconData iconData,
    Duration duration = const Duration(seconds: 2),
    BuildContext? context,
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: backgroundColor,
      iconData: iconData,
      duration: duration,
    );
  }

  static void _showSnackbar({
    required String message,
    required Color backgroundColor,
    required IconData iconData,
    Duration duration = const Duration(seconds: 2),
    BuildContext? context,
  }) {
    final resContext = context ?? globalNavigatorKey.currentContext;

    final snackbar = SnackBar(
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight:
              (resContext?.getHeight ?? ScreenUtil.defaultSize.height) * 0.4,
        ),
        child: Row(
          children: <Widget>[
            Icon(iconData, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      duration: duration,
    );

    if (resContext != null) {
      ScaffoldMessenger.of(resContext).showSnackBar(snackbar);
    }
  }

  static void closeSnackbar({BuildContext? context}) {
    if (context == null) return;
    ScaffoldMessenger.of(context).clearSnackBars();
  }
}

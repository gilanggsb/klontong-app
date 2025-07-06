import 'package:flutter/material.dart';

import '../common.dart';

class EmptyStateWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final Widget? icon;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final VoidCallback? onButtonPressed;
  final String buttonText;
  final double? width, height;

  const EmptyStateWidget({
    super.key,
    this.title,
    this.message,
    this.icon,
    this.titleStyle,
    this.messageStyle,
    this.onButtonPressed,
    this.buttonText = "Refresh",
    this.width,
    this.height,
  });

  factory EmptyStateWidget.dataNotfound({
    String? title,
    String? message,
    Widget? icon,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    VoidCallback? onButtonPressed,
    double? width,
    height,
  }) => EmptyStateWidget(
    icon: const Icon(Icons.folder_off_rounded, size: 40),
    title: title ?? "Data not found",
    message: message,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            const SizedBox(height: 16.0),
            Text(
              title ?? '',
              style:
                  titleStyle ??
                  AppStyle.text.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            Text(
              message ?? '',
              style:
                  messageStyle ??
                  AppStyle.text.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
            ),
            if (onButtonPressed != null) ...[
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: onButtonPressed,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  textStyle: const TextStyle(fontSize: 12),
                  foregroundColor: AppPalette.whiteBase, // For text/icon color
                ),
                child: Text(buttonText, style: AppStyle.text),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

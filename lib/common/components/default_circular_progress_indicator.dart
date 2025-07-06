import 'package:flutter/material.dart';

import '../common.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  final double? value;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double strokeWidth, size;
  const DefaultCircularProgressIndicator({
    super.key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.semanticsLabel,
    this.strokeWidth = 3.0,
    this.semanticsValue,
    this.color,
    this.size = 24,
  });

  factory DefaultCircularProgressIndicator.white({
    double? value,
    Color? valueColor,
    String? semanticsLabel,
    String? semanticsValue,
    double strokeWidth = 3.0,
    Color? color,
    double size = 24,
  }) =>
      const DefaultCircularProgressIndicator(
        backgroundColor: AppPalette.whiteBase,
      );

  factory DefaultCircularProgressIndicator.blue({
    double? value,
    Color? valueColor,
    String? semanticsLabel,
    String? semanticsValue,
    double strokeWidth = 3.0,
    Color? color,
    double size = 24,
  }) =>
      const DefaultCircularProgressIndicator(
        backgroundColor: AppPalette.primaryBase,
        color: AppPalette.whiteBase,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
        color: color ?? AppPalette.primaryBase,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
        strokeWidth: strokeWidth,
        value: value,
        valueColor: valueColor,
      ),
    );
  }
}

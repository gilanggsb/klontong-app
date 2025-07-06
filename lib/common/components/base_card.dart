import 'package:flutter/material.dart';

import '../common.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.onTap,
    this.padding,
    this.boxShadow,
    this.backgroundColor,
    this.margin,
    this.borderRadius,
    this.customBorderRadius,
    this.maxWidth,
    this.maxHeight,
  });
  final Widget child;
  final double? width, height, borderRadius, maxWidth, maxHeight;
  final VoidCallback? onTap;
  final EdgeInsets? padding, margin;
  final List<BoxShadow>? boxShadow;
  final Color? backgroundColor;
  final BorderRadius? customBorderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? double.infinity,
          maxHeight: maxHeight ?? double.infinity,
        ),
        width: width,
        height: height,
        margin: margin,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppPalette.whiteBase,
          borderRadius:
              customBorderRadius ?? BorderRadius.circular(borderRadius ?? 10),
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: AppPalette.black50.withAlpha((255 * 0.25).toInt()),
                ),
              ],
        ),
        child: child,
      ),
    );
  }
}

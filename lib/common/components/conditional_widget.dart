import 'package:flutter/material.dart';

class ConditionalWidget extends StatelessWidget {
  const ConditionalWidget({
    super.key,
    required this.showTrueWidget,
    required this.trueWidget,
    required this.falseWidget,
  });
  final bool showTrueWidget;
  final Widget trueWidget;
  final Widget falseWidget;

  @override
  Widget build(BuildContext context) {
    if (showTrueWidget) {
      return trueWidget;
    }

    return falseWidget;
  }
}

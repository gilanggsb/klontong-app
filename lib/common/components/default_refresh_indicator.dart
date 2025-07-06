import 'package:flutter/material.dart';

import '../common.dart';

class DefaultRefreshIndicator extends StatelessWidget {
  const DefaultRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });
  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppPalette.whiteBase,
      color: AppPalette.primaryBase,
      onRefresh: onRefresh,
      child: child,
    );
  }
}

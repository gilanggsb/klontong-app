import 'package:flutter/material.dart';

import '../common.dart';

class LoadingOverlayAlt extends StatelessWidget {
  LoadingOverlayAlt({super.key, required this.child})
    : _isLoadingNotifier = ValueNotifier<bool>(false);

  final ValueNotifier<bool> _isLoadingNotifier;
  final Widget child;

  static LoadingOverlayAlt of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<LoadingOverlayAlt>()!;
  }

  bool get isLoading => _isLoadingNotifier.value;

  void show() {
    _isLoadingNotifier.value = true;
  }

  void hide() {
    _isLoadingNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoadingNotifier,
      child: child,
      builder: (context, isLoading, child) {
        return Material(
          child: Stack(
            children: [
              child!,
              if (isLoading)
                ModalBarrier(
                  dismissible: false,
                  // color: Colors.black.withOpacity(0.5),
                  color: Colors.black.withAlpha((255 * 0.5).toInt()),
                ),
              if (isLoading)
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppPalette.black50,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const DefaultCircularProgressIndicator(size: 32),
                        const SizedBox(height: 18),
                        Text(
                          'Mohon Tunggu...',
                          style: AppStyle.text.copyWith(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w700,
                            color: AppPalette.whiteBase,
                          ),
                          // fontSize: 14,
                          // decoration: TextDecoration.none,
                          // fontWeight: FontWeight.w700,
                          // color: AppPalette.whiteBase,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

void showLoading() {
  if (globalNavigatorKey.currentContext == null) return;
  return LoadingOverlayAlt.of(globalNavigatorKey.currentContext!).show();
}

void dismissLoading() {
  if (globalNavigatorKey.currentContext == null) return;
  if (!LoadingOverlayAlt.of(globalNavigatorKey.currentContext!).isLoading) {
    return;
  }
  return LoadingOverlayAlt.of(globalNavigatorKey.currentContext!).hide();
}

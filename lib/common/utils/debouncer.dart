import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  static Timer? _debounce;

  static void run(
    VoidCallback action, {
    Duration delay = const Duration(milliseconds: 500),
  }) {
    _debounce?.cancel();
    _debounce = Timer(delay, action);
  }

  static void cancel() {
    _debounce?.cancel();
  }
}

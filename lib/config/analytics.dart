import 'dart:js' as js;

import 'package:flutter/material.dart';

class Analytics {
  static void logEvent(String eventName, [Map<String, dynamic>? parameters]) {
    try {
      if (parameters != null) {
        js.context.callMethod('gtag', ['event', eventName, parameters]);
      } else {
        js.context.callMethod('gtag', ['event', eventName]);
      }
    } catch (e) {
      debugPrint('Error logging event $eventName: $e');
    }
  }
}

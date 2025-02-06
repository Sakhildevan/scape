// analytics_observer.dart
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnalyticsRouteObserver extends NavigatorObserver {
  void _sendPageView(String routeName) {
    try {
      js.context.callMethod('gtag', [
        'event',
        'page_view',
        {'page_path': routeName}
      ]);
    } catch (e) {
      debugPrint('Error sending analytics event: $e');
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name != null) {
      _sendPageView(route.settings.name!);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute?.settings.name != null) {
      _sendPageView(newRoute!.settings.name!);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute?.settings.name != null) {
      _sendPageView(previousRoute!.settings.name!);
    }
  }
}

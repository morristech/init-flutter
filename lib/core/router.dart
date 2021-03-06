import 'package:my_app/view/dashboard/dashboard_page.dart';
import 'package:my_app/view/utility/init_view.dart';
import 'package:flutter/material.dart';
import 'package:ping9/ping9.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    /// add settings on MaterialPageRoute for which route you want to tracking
    final data = settings.arguments;
    switch (settings.name) {
      case '/init-view':
        return MaterialPageRoute(
            builder: (_) => InitView(), settings: settings);
      case '/':
        return MaterialPageRoute(
            builder: (_) => DashboardPage(), settings: settings);

      case '/web-view':
        return MaterialPageRoute(
            builder: (_) => WebViewRouter(data), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => EmptyView(title: settings.name));
    }
  }

  static String getNameExtractor(RouteSettings settings) {
    /// User for override route's name
    switch (settings.name) {
      case '/':
        return null;
      default:
        return settings.name;
    }
  }
}

import 'package:blablagithub/src/presentation/authentication/pages/auth_page.dart';
import 'package:blablagithub/src/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class AppRoutes {
  static Route unauthenticated(RouteSettings settings) {
    return _pageRoute(settings, const AuthPage());
  }

  static Route authenticated(RouteSettings settings) {
    return _pageRoute(settings, const HomePage());
  }

  static Route _pageRoute(RouteSettings settings, Widget page) {
    return MaterialPageRoute(settings: settings, builder: (_) => page);
  }
}

import 'package:blablagithub/routes.dart';
import 'package:flutter/material.dart';

class AuthenticatedApp extends StatelessWidget {
  const AuthenticatedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.authenticated,
    );
  }
}

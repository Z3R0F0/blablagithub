import 'package:blablagithub/routes.dart';
import 'package:flutter/material.dart';

class UnauthenticatedApp extends StatelessWidget {
  const UnauthenticatedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.unauthenticated,
    );
  }
}

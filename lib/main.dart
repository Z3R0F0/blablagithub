import 'package:blablagithub/dependency_injection.dart';
import 'package:blablagithub/firebase_options.dart';
import 'package:blablagithub/src/presentation/app/pages/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initInjections();

  runApp(
    const _BlaBlaGitHub(),
  );
}

class _BlaBlaGitHub extends StatelessWidget {
  const _BlaBlaGitHub();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}

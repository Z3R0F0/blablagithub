import 'package:blablagithub/dependency_injection.dart';
import 'package:blablagithub/src/presentation/app/bloc/app_bloc.dart';
import 'package:blablagithub/src/presentation/app/pages/authenticated_app.dart';
import 'package:blablagithub/src/presentation/app/pages/splash_page.dart';
import 'package:blablagithub/src/presentation/app/pages/unauthenticated_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppBloc appBloc;

  @override
  void initState() {
    appBloc = locator<AppBloc>();
    super.initState();
  }

  @override
  void dispose() {
    appBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: appBloc),
      ],
      child: BlocConsumer(
        bloc: appBloc,
        listener: (context, state) {
          if (state is AuthenticatedAppState) {
            setState(() {});
          } else if (state is UnauthenticatedAppState) {
            setState(() {});
          }
        },
        builder: (context, state) {
          if (state is AuthenticatedAppState) {
            return const AuthenticatedApp();
          }
          if (state is UnauthenticatedAppState) {
            return const UnauthenticatedApp();
          }
          return const SplashPage();
        },
      ),
    );
  }
}

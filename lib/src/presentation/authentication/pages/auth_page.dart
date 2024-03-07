import 'dart:async';
import 'dart:io';

import 'package:blablagithub/components/morph_container.dart';
import 'package:blablagithub/constants/app_colors.dart';
import 'package:blablagithub/constants/app_images.dart';
import 'package:blablagithub/dependency_injection.dart';
import 'package:blablagithub/src/presentation/app/bloc/app_bloc.dart';
import 'package:blablagithub/src/presentation/authentication/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late AuthBloc authBloc;
  late AppBloc appBloc;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    authBloc = locator<AuthBloc>();
    appBloc = BlocProvider.of<AppBloc>(context);
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    authBloc.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: BlocConsumer(
        bloc: authBloc,
        listener: (context, state) async {
          if (state is SuccessAuthState) {
            setState(() {
              _controller.reverse();
            });
            await Future.delayed(const Duration(milliseconds: 200), () async {
              appBloc.add(GetUserEvent());
            });
          }
          if (state is FailureAuthState) {}
          if (state is LoadingAuthState) {}
        },
        builder: (context, state) {
          return buildBody();
        },
      ),
    );
  }

  Widget _containerChild() {
    return Platform.isIOS
        ? Image.asset(AppImages.apple)
        : Image.asset(AppImages.google);
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 3),
          child: Column(
            children: [
              MorphContainer(
                onPressed: () {
                  onPressLoginButton();
                },
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: FadeTransition(
                      opacity: _animation, child: _containerChild()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onPressLoginButton() {
    if (Platform.isAndroid) {
      authBloc.add(AuthGoogleEvent());
    } else if (Platform.isIOS) {
      authBloc.add(AuthAppleEvent());
    } else {
      throw UnimplementedError();
    }
  }
}

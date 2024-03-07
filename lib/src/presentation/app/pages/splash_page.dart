import 'package:blablagithub/components/morph_container.dart';
import 'package:blablagithub/src/presentation/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final AppBloc appBloc;
  bool stop = false;

  @override
  void initState() {
    appBloc = BlocProvider.of<AppBloc>(context);
    super.initState();
  }

  void dance() {
    Future.delayed(const Duration(milliseconds: 3000)).whenComplete(() {
      appBloc.add(GetUserEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 3;
    double itemHeight = MediaQuery.of(context).size.height / 3;
    dance();
    return Scaffold(
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: itemWidth / itemHeight,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          int milliseconds = (index % 2 == 0) ? 500 : 700;
          return buildDance(milliseconds, const Duration(milliseconds: 1900));
        },
      ),
    );
  }

  Widget buildDance(int milliseconds, Duration full) {
    return DancingContainer(
      finish: full,
      duration: Duration(milliseconds: milliseconds),
    );
  }
}

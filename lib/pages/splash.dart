import 'package:flutter/material.dart';
import 'package:ortoclinica/pages/home.dart';

import '../controllers/shared_preferences_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.wait([
      SharedPreferencesController.verificarLogado(),
    ]).then((value) {
      if (value[0][0]) {
        Navigator.pushNamed(
          context,
          Home.routeName,
          arguments: DadosUserLogado(value[0][1], value[0][2]),
        );
      } else {
        Navigator.pushNamed(context, '/login');
      }
    });
    return Scaffold(
      body: Container(),
    );
  }
}

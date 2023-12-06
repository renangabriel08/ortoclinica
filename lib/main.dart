import 'package:flutter/material.dart';
import 'package:ortoclinica/pages/agenda.dart';
import 'package:ortoclinica/pages/cadastro.dart';
import 'package:ortoclinica/pages/esqueceu_senha.dart';
import 'package:ortoclinica/pages/home.dart';
import 'package:ortoclinica/pages/login.dart';
import 'package:ortoclinica/pages/nova_senha.dart';
import 'package:ortoclinica/pages/splash.dart';
import 'package:ortoclinica/styles/cores.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routeName,
      theme: ThemeData(
        primarySwatch: Cores.customSwatch,
      ),
      routes: {
        '/splash': (context) => const Splash(),
        '/login': (context) => const Login(),
        '/cadastro': (context) => const Cadastro(),
        Home.routeName: (context) => const Home(),
        '/esqueceuSenha': (context) => const EsqueceuSenha(),
        '/novaSenha': (context) => const NovaSenha(),
        '/agenda': (context) => const Agenda(),
      },
    );
  }
}

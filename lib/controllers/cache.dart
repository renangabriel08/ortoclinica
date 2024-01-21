import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheController {
  static verificarLogado(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? logado = prefs.getBool('logado');

    if (logado == null || !logado) {
      Navigator.pushNamed(context, '/login');
    } else {
      Navigator.pushNamed(context, '/home');
    }
  }

  static salvarLogado(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setBool('logado', true);
  }

  static apagarDados(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('logado');
  }

  static getToken() {
    return SharedPreferences.getInstance().then(
      (prefs) => prefs.getString('token'),
    );
  }
}

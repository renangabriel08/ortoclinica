import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  static Future<List> verificarLogado() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('logado') != null) {
      return [
        prefs.getBool('logado')!,
        prefs.getString('token'),
        prefs.getString('nome'),
      ];
    }
    return [false];
  }

  static salvarLogado(String token, String nome) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('nome', nome);
    await prefs.setBool('logado', true);
  }

  static apagarDados(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('logado');
  }
}

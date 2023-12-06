import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController {
  static Future<List<String>> logar(String email, String senha) async {
    try {
      final url = Uri.parse('http://26.101.238.208:3000/tp01/usuarios/login');
      var req = await http.post(url, body: {'email': email, 'senha': senha});
      final res = await jsonDecode(utf8.decode(req.bodyBytes));
      if (req.statusCode == 200) {
        return [
          res['message'],
          res['token'],
          res['nome'],
        ];
      } else {
        return [
          'Usuário/senha incorretos',
        ];
      }
    } catch (e) {
      return [
        'Erro, tente novamente',
      ];
    }
  }
}

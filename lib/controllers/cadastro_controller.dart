import 'dart:convert';
import 'package:http/http.dart' as http;

class CadastroController {
  static Future<String>cadastrar(
    String nome,
    String email,
    String senha,
    String dt_nascimento,
  ) async {
    try {
      final url =
          Uri.parse('http://26.101.238.208:3000/tp01/usuarios/cadastro');
      var req = await http.post(url, body: {
        'nome': nome,
        'email': email,
        'senha': senha,
        'dt_nascimento': dt_nascimento,
      });
      final res = await jsonDecode(utf8.decode(req.bodyBytes));

      if (req.statusCode == 201) {
        return res['message'];
      } else {
        return 'Erro ao cadastrar';
      }
    } catch (e) {
      return 'Erro ao cadastrar';
    }
  }
}

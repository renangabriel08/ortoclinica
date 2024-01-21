import 'dart:convert';

import 'package:ortoclinica/controllers/cache.dart';
import 'package:http/http.dart' as http;
import 'package:ortoclinica/widgets/toast.dart';

class HomeController {
  static getData() async {
    try {
      final url = Uri.parse('http://26.101.238.208:3000/ortoclinica/medicos');
      final token = await CacheController.getToken();
      final req = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (req.statusCode == 200) {
        final res = jsonDecode(utf8.decode(req.bodyBytes));
        return res['resultado'];
      }
    } catch (e) {
      MyToast.gerarToast('Erro ao buscar médicos');
    }
  }

  static getUser() async {
    final token = await CacheController.getToken();
    print(token);
    return true;
  }
}

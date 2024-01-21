import 'dart:convert';
import 'package:http/http.dart' as http;

class MedicosController {
  static getMedicos(String token) async {
    print('object');
    try {
      final url = Uri.parse('http://192.168.86.104:3000/tp04/produtos');
      var req = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      final res = await jsonDecode(utf8.decode(req.bodyBytes));
      if (req.statusCode == 200) {
        print(res);
      } else {
        print(res);
      }
    } catch (e) {
      print('erroooooo');
    }
  }
}

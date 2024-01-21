// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ortoclinica/widgets/toast.dart';

class CadastroController {
  static cadastrar(
    String nome,
    String email,
    String senha,
    String nascimento,
    BuildContext context,
  ) async {
    try {
      final url = Uri.parse(
        'http://26.101.238.208:3000/ortoclinica/usuarios/cadastro',
      );
      var req = await http.post(url, body: {
        'nome': nome,
        'email': email,
        'senha': senha,
        'dt_nascimento': nascimento,
      });

      if (req.statusCode == 201) {
        final res = await jsonDecode(utf8.decode(req.bodyBytes));
        MyToast.gerarToast(res['message']);
        Navigator.pushNamed(context, '/login');
      } else {
        MyToast.gerarToast('Erro ao se cadastrar');
      }
    } catch (e) {
      MyToast.gerarToast('Erro ao se cadastrar');
    }
  }
}

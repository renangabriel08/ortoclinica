// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ortoclinica/controllers/cache.dart';
import 'package:ortoclinica/widgets/toast.dart';

class LoginController {
  static logar(String email, String senha, BuildContext context) async {
    try {
      final url = Uri.parse(
        'http://26.101.238.208:3000/ortoclinica/usuarios/login',
      );
      final req = await http.post(url, body: {'email': email, 'senha': senha});

      if (req.statusCode == 200) {
        final res = jsonDecode(utf8.decode(req.bodyBytes));
        MyToast.gerarToast(res['message']);
        CacheController.salvarLogado(res['token']);
        Navigator.pushNamed(context, '/home');
      } else {
        MyToast.gerarToast('Email ou senha incorreto');
      }
    } catch (e) {
      MyToast.gerarToast('Erro ao realizar login');
    }
  }
}

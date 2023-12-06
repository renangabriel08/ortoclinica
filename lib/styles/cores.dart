import 'package:flutter/material.dart';

class Cores {
  static Color branco = const Color(0xFFFFFFFF);
  static Color preto = const Color(0xFF404041);
  static Color cinzaLinha = const Color(0xFFE8ECF4);
  static Color cinzaTexto = const Color(0xFF6A707C);
  static Color azul = const Color(0xFF35C2C1);
  static Color azulClaro = const Color.fromARGB(20, 14, 190, 128);
  static Color verde = const Color(0xFF0EBE7E);
  static Color amarelo = const Color(0xFFF6D060);
  static Color vermelho = const Color(0xFFFF0000);
  static Color tituloPopUp = const Color(0xFF333333);
  static Color textoPopUp = const Color(0xFF677294);

  static final MaterialColor customSwatch = MaterialColor(
    azul.value,
    <int, Color>{
      50: azul.withOpacity(0.1),
      100: azul.withOpacity(0.2),
      200: azul.withOpacity(0.3),
      300: azul.withOpacity(0.4),
      400: azul.withOpacity(0.5),
      500: azul.withOpacity(0.6),
      600: azul.withOpacity(0.7),
      700: azul.withOpacity(0.8),
      800: azul.withOpacity(0.9),
      900: azul.withOpacity(1.0),
    },
  );
}

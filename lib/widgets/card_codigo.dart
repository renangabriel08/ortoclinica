import 'package:flutter/material.dart';
import 'package:ortoclinica/styles/cores.dart';

class CardCodigo extends StatelessWidget {
  final String numero;
  const CardCodigo({super.key, required this.numero});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Cores.branco,
        border: Border.all(
          color: Cores.azul,
          width: 4,
        ),
      ),
      child: Center(
        child: Text(
          numero,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Cores.preto,
          ),
        ),
      ),
    );
  }
}

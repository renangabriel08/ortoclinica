import 'package:flutter/material.dart';
import 'package:ortoclinica/styles/cores.dart';

class CardIcone extends StatelessWidget {
  final icone;
  final String texto;
  final int id;
  const CardIcone({super.key, required this.icone, required this.texto, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (id == 2) {
              Navigator.pushNamed(context, '/agenda');
            }
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Cores.azul, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icone,
              color: Cores.azul,
              size: 35,
            ),
          ),
        ),
        Container(height: 3),
        Text(
          texto,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

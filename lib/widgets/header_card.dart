import 'package:flutter/material.dart';

import '../styles/cores.dart';

class HeaderCard extends StatelessWidget {
  final String titulo;
  final int id;
  const HeaderCard({super.key, required this.titulo, required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Cores.preto,
            ),
          ),
          id != 1
              ? TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        'Ver todos',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Cores.textoPopUp,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Cores.textoPopUp,
                        size: 10,
                      ),
                    ],
                  ),
                )
              : Container(height: 50)
        ],
      ),
    );
  }
}

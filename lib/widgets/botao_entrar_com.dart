import 'package:flutter/material.dart';
import 'package:ortoclinica/styles/cores.dart';

class BotaoEntrarCom extends StatelessWidget {
  const BotaoEntrarCom({super.key, required this.icone});
  final icone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Cores.cinza),
      ),
      child: Center(
        child: icone,
      ),
    );
  }
}

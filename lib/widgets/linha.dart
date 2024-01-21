import 'package:flutter/material.dart';
import 'package:ortoclinica/styles/cores.dart';

class Linha extends StatelessWidget {
  const Linha({super.key});

  @override
  Widget build(BuildContext context) {
    double widthTela = MediaQuery.of(context).size.width;
    return Container(
      color: Cores.cinza,
      width: widthTela * .3,
      height: 1,
    );
  }
}

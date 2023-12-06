// import 'package:flutter/material.dart';
// import 'package:ortoclinica/controllers/escolhas_controller.dart';
// import 'package:ortoclinica/styles/cores.dart';

// class CardHorarioDisponivel extends StatefulWidget {
//   final String horario;
//   final String periodo;
//   final int id;
//   const CardHorarioDisponivel({
//     super.key,
//     required this.horario,
//     required this.periodo,
//     required this.id,
//   });

//   @override
//   State<CardHorarioDisponivel> createState() => _CardHorarioDisponivelState();
// }

// class _CardHorarioDisponivelState extends State<CardHorarioDisponivel> {
//   var corNaoSelecionado1 = Cores.azulClaro;
//   var corNaoSelecionado2 = Cores.azul;
//   var weightNaoSelecionado = FontWeight.w400;
//   double fontNaoSelecionado = 13;

//   var corSelecionado1 = Cores.azul;
//   var corSelecionado2 = Cores.branco;
//   var weightSelecionado = FontWeight.w500;
//   double fontSelecionado = 14;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           EscolhasController.selecionado = [
//             false,
//             false,
//             false,
//             false,
//             false,
//           ];
//           EscolhasController.selecionado[widget.id] = true;
//         });
//       },
//       child: Container(
//         width: 60,
//         height: 60,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(999),
//           color: EscolhasController.selecionado[widget.id]
//               ? corSelecionado1
//               : corNaoSelecionado1,
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 widget.horario,
//                 style: TextStyle(
//                   color: EscolhasController.selecionado[widget.id]
//                       ? corSelecionado2
//                       : corNaoSelecionado2,
//                   fontSize: EscolhasController.selecionado[widget.id]
//                       ? fontSelecionado
//                       : fontNaoSelecionado,
//                   fontWeight: EscolhasController.selecionado[widget.id]
//                       ? weightSelecionado
//                       : weightNaoSelecionado,
//                 ),
//               ),
//               Text(
//                 widget.periodo,
//                 style: TextStyle(
//                   color: EscolhasController.selecionado[widget.id]
//                       ? corSelecionado2
//                       : corNaoSelecionado2,
//                   fontSize: EscolhasController.selecionado[widget.id]
//                       ? fontSelecionado
//                       : fontNaoSelecionado,
//                   fontWeight: EscolhasController.selecionado[widget.id]
//                       ? weightSelecionado
//                       : weightNaoSelecionado,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../styles/cores.dart';

class CardMedico extends StatefulWidget {
  final String nota;
  final String img;
  final String nome;
  final String preco;
  const CardMedico({
    super.key,
    required this.nota,
    required this.img,
    required this.nome,
    required this.preco,
  });

  @override
  State<CardMedico> createState() => _CardMedicoState();
}

class _CardMedicoState extends State<CardMedico> {
  Icon iconeSelecionado = Icon(
    Icons.favorite,
    color: Cores.vermelho,
    size: 18,
  );
  Icon iconeNaoSelecionado = const Icon(
    Icons.favorite_outline,
    color: Colors.grey,
    size: 18,
  );

  bool selecionado = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Cores.branco,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 3,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: selecionado ? iconeSelecionado : iconeNaoSelecionado,
                onTap: () => setState(() {
                  selecionado ? selecionado = false : selecionado = true;
                }),
              ),
              SizedBox(
                width: 45,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.star,
                      color: Cores.amarelo,
                      size: 20,
                    ),
                    Text(
                      widget.nota.length == 1
                          ? '${widget.nota}.0'
                          : widget.nota,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Image.network(
              widget.img,
              width: 54,
              height: 54,
            ),
          ),
          Column(
            children: [
              Text(
                widget.nome,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Cores.cinza,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.attach_money_rounded,
                    color: Colors.green,
                    size: 18,
                  ),
                  Text(
                    '${widget.preco} / hora',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ortoclinica/styles/cores.dart';
import 'package:ortoclinica/widgets/card_codigo.dart';

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({super.key});

  @override
  State<EsqueceuSenha> createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  @override
  Widget build(BuildContext context) {
    double widthTela = MediaQuery.of(context).size.width;
    double heightTela = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            height: heightTela,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(height: heightTela * .01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Esqueceu a ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 30,
                          color: Cores.preto,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'senha?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 30,
                          color: Cores.azul,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Não se preocupe! Insira o endereço de e-mail e sua data de nascimento vinculado à sua conta.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Cores.preto,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text('Email'),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Cores.azul),
                            ),
                          ),
                          cursorColor: Cores.azul,
                        ),
                        Container(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text(
                              'Data de nascimento',
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Cores.azul),
                            ),
                          ),
                          cursorColor: Cores.azul,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Cores.preto,
                      fixedSize: Size(widthTela, 64),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/novaSenha'),
                    child: Text(
                      'Enviar código',
                      style: TextStyle(
                        fontSize: 18,
                        color: Cores.branco,
                      ),
                    ),
                  ),
                  Container(
                    width: 370,
                    height: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Cores.cinzaLinha,
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CardCodigo(numero: '1'),
                            CardCodigo(numero: '5'),
                            CardCodigo(numero: '7'),
                            CardCodigo(numero: '6'),
                            CardCodigo(numero: '9'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Lembrou da senha?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Entre agora',
                          style: TextStyle(color: Cores.azul),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

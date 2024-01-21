import 'package:flutter/material.dart';
import 'package:ortoclinica/controllers/form.dart';
import 'package:ortoclinica/styles/cores.dart';
import 'package:ortoclinica/widgets/card_codigo.dart';

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({super.key});

  @override
  State<EsqueceuSenha> createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String nascimento = 'Data de nascimento';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    gerarCalendario() {
      showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialDate: DateTime.now(),
      ).then((value) {
        if (value != null) {
          nascimento = '${value.year}-${value.month}-${value.day}';
          setState(() {});
        }
      });
    }

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(height: height * .01),
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
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => email = value,
                          validator: (value) =>
                              FormLoginController.validarLogin(email),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.email_outlined),
                            label: const Text('E-mail'),
                          ),
                        ),
                        Container(height: height * .02),
                        GestureDetector(
                          onTap: () => gerarCalendario(),
                          child: Container(
                            width: width,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    nascimento,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Icon((Icons.calendar_month_outlined)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Cores.preto,
                      fixedSize: Size(width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                      color: Cores.cinza,
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

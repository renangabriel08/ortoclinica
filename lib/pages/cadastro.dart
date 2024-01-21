import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ortoclinica/controllers/cadastro.dart';
import 'package:ortoclinica/controllers/form.dart';
import 'package:ortoclinica/styles/cores.dart';
import 'package:ortoclinica/widgets/botao_entrar_com.dart';
import 'package:ortoclinica/widgets/linha.dart';

import '../widgets/toast.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();

  bool obscureText1 = true;
  bool obscureText2 = true;

  String nome = '';
  String email = '';
  String senha = '';
  String confirmarSenha = '';
  String nascimento = 'Data de nascimento';

  void cadastrar() async {
    if (_formKey.currentState!.validate()) {
      if (nascimento != 'Data de nascimento') {
        await CadastroController.cadastrar(
          nome,
          email,
          senha,
          nascimento,
          context,
        );
      }
      MyToast.gerarToast('Preencha todos os campos');
    } else {
      MyToast.gerarToast('Preencha todos os campos corretamente');
    }
  }

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
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(height: height * .02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bem-vindo a',
                        style: TextStyle(
                          fontSize: 30,
                          color: Cores.preto,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'clinica ',
                            style: TextStyle(
                              fontSize: 30,
                              color: Cores.preto,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Ortoclinica!',
                            style: TextStyle(
                              fontSize: 30,
                              color: Cores.azul,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onChanged: (value) => nome = value,
                          validator: (value) =>
                              FormCadastroController.validarNome(nome),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: const Text('Nome'),
                          ),
                        ),
                        Container(height: height * .02),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => email = value,
                          validator: (value) =>
                              FormCadastroController.validarEmail(email),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: const Text('Email'),
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
                        Container(height: height * .02),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) => senha = value,
                          validator: (value) =>
                              FormCadastroController.validarSenha(senha),
                          obscureText: obscureText1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                obscureText1 = !obscureText1;
                              }),
                              icon: Icon(
                                obscureText1
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),
                            label: const Text('Senha'),
                          ),
                        ),
                        Container(height: height * .02),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) => confirmarSenha = value,
                          validator: (value) =>
                              FormCadastroController.validarConfirmarSenha(
                            confirmarSenha,
                            senha,
                          ),
                          obscureText: obscureText2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                obscureText2 = !obscureText2;
                              }),
                              icon: Icon(
                                obscureText2
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),
                            label: const Text('Confirmar senha'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Cores.azul,
                        fixedSize: Size(width, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () => cadastrar(),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Cores.branco,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Linha(),
                          Text('Registrar com'),
                          Linha(),
                        ],
                      ),
                      Container(height: height * .02),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BotaoEntrarCom(
                            icone: FaIcon(FontAwesomeIcons.facebook),
                          ),
                          BotaoEntrarCom(
                            icone: FaIcon(FontAwesomeIcons.google),
                          ),
                          BotaoEntrarCom(
                            icone: FaIcon(FontAwesomeIcons.twitter),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Já possui conta?'),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: const Text('Entre agora'),
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

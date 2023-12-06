import 'package:flutter/material.dart';
import 'package:ortoclinica/controllers/cadastro_controller.dart';
import 'package:ortoclinica/controllers/form_controller.dart';
import 'package:ortoclinica/styles/cores.dart';
import 'package:ortoclinica/widgets/botao_entrar_com.dart';
import 'package:ortoclinica/widgets/linha.dart';

import '../widgets/mensagem_toast.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _controller = TextEditingController();

  bool esconderSenha = true;
  bool esconderConfirmarSenha = true;
  Icon iconeSenha = const Icon(Icons.visibility_outlined);
  Icon iconeConfirmarSenha = const Icon(Icons.visibility_outlined);

  String nome = '';
  String email = '';
  String senha = '';
  String confirmarSenha = '';
  String dt_nascimento = '';

  final _formKey = GlobalKey<FormState>();

  void funcaoEsconderConfirmarSenha() {
    setState(() {
      if (esconderConfirmarSenha) {
        esconderConfirmarSenha = false;
        iconeConfirmarSenha = const Icon(Icons.visibility_off_outlined);
      } else {
        esconderConfirmarSenha = true;
        iconeConfirmarSenha = const Icon(Icons.visibility_outlined);
      }
    });
  }

  void funcaoEsconderSenha() {
    setState(() {
      if (esconderSenha) {
        esconderSenha = false;
        iconeSenha = const Icon(Icons.visibility_off_outlined);
      } else {
        esconderSenha = true;
        iconeSenha = const Icon(Icons.visibility_outlined);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthTela = MediaQuery.of(context).size.width;
    double heightTela = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            width: heightTela,
            height: heightTela,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(height: heightTela * .02),
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
                            border: const OutlineInputBorder(),
                            label: const Text('Nome completo'),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Cores.azul),
                            ),
                          ),
                          cursorColor: Cores.azul,
                        ),
                        Container(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => email = value,
                          validator: (value) =>
                              FormCadastroController.validarEmail(email),
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
                          controller: _controller,
                          keyboardType: TextInputType.text,
                          onChanged: (value) => dt_nascimento = value,
                          validator: (value) =>
                              FormCadastroController.validarDataNascimento(
                                  dt_nascimento),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text('Data de nascimento'),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_month),
                              onPressed: () => showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              ).then(
                                (value) => _controller.text =
                                    value.toString().split(' ').first,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Cores.azul),
                            ),
                            focusColor: Cores.azul,
                          ),
                          cursorColor: Cores.azul,
                        ),
                        Container(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) => senha = value,
                          validator: (value) =>
                              FormCadastroController.validarSenha(senha),
                          obscureText: esconderSenha,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () => funcaoEsconderSenha(),
                              icon: iconeSenha,
                            ),
                            label: const Text('Senha'),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Cores.azul),
                            ),
                          ),
                          cursorColor: Cores.azul,
                        ),
                        Container(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) => confirmarSenha = value,
                          validator: (value) =>
                              FormCadastroController.validarConfirmarSenha(
                            value,
                            senha,
                          ),
                          obscureText: esconderConfirmarSenha,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () => funcaoEsconderConfirmarSenha(),
                              icon: iconeConfirmarSenha,
                            ),
                            label: const Text('Confirmar senha'),
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
                      backgroundColor: Cores.azul,
                      fixedSize: Size(widthTela, 64),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final res = await CadastroController.cadastrar(
                          nome,
                          email,
                          senha,
                          dt_nascimento,
                        );
                        if (res == 'Usuário Cadastrado com Sucesso!') {
                          MensagemToast.gerarToast(res);
                          Navigator.pushNamed(context, '/login');
                        } else {
                          MensagemToast.gerarToast(res);
                        }
                      }
                    },
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
                      Container(
                        height: 15,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BotaoEntrarCom(icone: Icon(Icons.facebook)),
                          BotaoEntrarCom(icone: Icon(Icons.email)),
                          BotaoEntrarCom(icone: Icon(Icons.apple)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Já possui conta?'),
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

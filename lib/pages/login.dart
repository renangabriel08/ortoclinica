import 'package:flutter/material.dart';
import 'package:ortoclinica/controllers/form_controller.dart';
import 'package:ortoclinica/controllers/login_controller.dart';
import 'package:ortoclinica/controllers/shared_preferences_controller.dart';
import 'package:ortoclinica/pages/home.dart';
import 'package:ortoclinica/styles/cores.dart';
import 'package:ortoclinica/widgets/botao_entrar_com.dart';
import 'package:ortoclinica/widgets/linha.dart';
import 'package:ortoclinica/widgets/mensagem_toast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  bool esconderSenha = true;
  Icon iconeSenha = const Icon(Icons.visibility_outlined);

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

    String email = '';
    String senha = '';

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            width: widthTela,
            height: heightTela,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(height: heightTela * .08),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bem-vindo de volta a',
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
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => email = value,
                          validator: (value) =>
                              FormLoginController.validarLogin(value),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text('E-mail'),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Cores.azul),
                            ),
                          ),
                          cursorColor: Cores.azul,
                        ),
                        Container(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) => senha = value,
                          validator: (value) =>
                              FormLoginController.validarLogin(value),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pushNamed(
                                context,
                                '/esqueceuSenha',
                              ),
                              child: Text(
                                'Esqueceu a senha?',
                                style: TextStyle(
                                  color: Cores.cinzaTexto,
                                ),
                              ),
                            ),
                          ],
                        )
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
                        final res = await LoginController.logar(email, senha);
                        if (res[0] == 'Autenticado com sucesso') {
                          SharedPreferencesController.salvarLogado(
                            res[1],
                            res[2],
                          );
                          MensagemToast.gerarToast(res[0]);
                          Navigator.pushNamed(
                            context,
                            Home.routeName,
                            arguments: DadosUserLogado(res[2], res[1]),
                          );
                        } else {
                          MensagemToast.gerarToast(res[0]);
                        }
                      }
                    },
                    child: Text(
                      'Entrar',
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
                          Text('Entar com'),
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
                      const Text('Não possui conta?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cadastro');
                        },
                        child: Text(
                          'Registre-se',
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

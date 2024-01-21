import 'package:flutter/material.dart';
import 'package:ortoclinica/controllers/form.dart';
import 'package:ortoclinica/controllers/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ortoclinica/styles/cores.dart';
import 'package:ortoclinica/widgets/botao_entrar_com.dart';
import 'package:ortoclinica/widgets/linha.dart';
import 'package:ortoclinica/widgets/toast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  String email = '';
  String senha = '';

  logar() async {
    if (_formKey.currentState!.validate()) {
      LoginController.logar(email, senha, context);
    } else {
      MyToast.gerarToast('Preencha todos os campos');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                  Container(height: height * .08),
                  //Header
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

                  //Form
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
                        TextFormField(
                          obscureText: obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) => senha = value,
                          validator: (value) =>
                              FormLoginController.validarLogin(senha),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                obscureText = !obscureText;
                              }),
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),
                            label: const Text('Senha'),
                          ),
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
                              child: const Text('Esqueceu a senha?'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Cores.azul,
                      fixedSize: Size(width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => logar(),
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
                      const Text('Não possui conta?'),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          '/cadastro',
                        ),
                        child: const Text('Registre-se'),
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

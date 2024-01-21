import 'package:flutter/material.dart';
import 'package:ortoclinica/styles/cores.dart';

class NovaSenha extends StatefulWidget {
  const NovaSenha({super.key});

  @override
  State<NovaSenha> createState() => _NovaSenhaState();
}

class _NovaSenhaState extends State<NovaSenha> {
  bool esconderSenha = true;
  bool esconderConfirmarSenha = true;
  Icon iconeSenha = const Icon(Icons.visibility_outlined);
  Icon iconeConfirmarSenha = const Icon(Icons.visibility_outlined);

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

  popUp() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Container(
          width: 335,
          height: 400,
          decoration: BoxDecoration(
            color: Cores.branco,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 156,
                height: 156,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: Cores.azul,
                ),
                child: Center(
                  child: Icon(
                    Icons.thumb_up,
                    color: Cores.azul,
                    size: 70,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Sucesso!',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Cores.cinza,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Sua senha foi alterada com sucesso!',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Cores.cinza,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Cores.preto,
                      fixedSize: const Size(295, 54),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: Text(
                      'Ir para login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Cores.branco,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Edite novamente',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Cores.cinza,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double widthTela = MediaQuery.of(context).size.width;
    double heightTela = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
                'Agora que você recuperou sua conta, digite sua nova senha nos campos abaixo!',
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
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: esconderSenha,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text('Nova senha'),
                        suffixIcon: IconButton(
                          onPressed: () => funcaoEsconderSenha(),
                          icon: iconeSenha,
                        ),
                      ),
                    ),
                    Container(height: 15),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: esconderConfirmarSenha,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text('Confirmar nova senha'),
                        suffixIcon: IconButton(
                          onPressed: () => funcaoEsconderConfirmarSenha(),
                          icon: iconeConfirmarSenha,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Cores.preto,
                  fixedSize: Size(widthTela, 64),
                ),
                onPressed: () => popUp(),
                child: Text(
                  'Enviar nova senha',
                  style: TextStyle(
                    fontSize: 18,
                    color: Cores.branco,
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
    );
  }
}

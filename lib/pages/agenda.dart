import 'package:flutter/material.dart';
import 'package:ortoclinica/styles/cores.dart';
import '../controllers/escolhas_controller.dart';

class Agenda extends StatefulWidget {
  const Agenda({super.key});

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  var corNaoSelecionado1 = Cores.azulClaro;
  var corNaoSelecionado2 = Cores.azul;
  var weightNaoSelecionado = FontWeight.w400;
  double fontNaoSelecionado = 13;

  var corSelecionado1 = Cores.azul;
  var corSelecionado2 = Cores.branco;
  var weightSelecionado = FontWeight.w500;
  double fontSelecionado = 14;

  popUp() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Container(
          width: 335,
          height: 450,
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
                  color: Cores.azulClaro,
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
                    'Obrigado!',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Cores.tituloPopUp,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Seu agendamento foi confirmado!',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Cores.textoPopUp,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                'Seu agendamento confirmado com Dr. Keniti em 17 de Agosto, às 02:00 PM',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Cores.textoPopUp,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Cores.preto,
                      fixedSize: const Size(295, 54),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    child: Text(
                      'Feito!',
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
                      'Edite seu agendamento',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Cores.cinzaTexto,
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
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Cores.branco,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 41,
                        height: 41,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Cores.cinzaLinha,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Cores.cinzaTexto,
                              size: 24,
                            ),
                            onPressed: () => Navigator.pushNamed(
                              context,
                              '/home',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Agenda',
                        style: TextStyle(
                          color: Color(0xFF9BC0BB),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 135,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2ED9C3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Renan Gabriel',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Icon(
                            Icons.person_outline_sharp,
                            size: 30,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 280,
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 2),
                    onDateChanged: (value) {},
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Horários disponíveis',
                    style: TextStyle(
                      color: Cores.cinzaTexto,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          EscolhasController.horarioSelecionado = [
                            false,
                            false,
                            false,
                            false,
                            false,
                          ];
                          EscolhasController.horarioSelecionado[0] = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: EscolhasController.horarioSelecionado[0]
                              ? corSelecionado1
                              : corNaoSelecionado1,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '10:00',
                                style: TextStyle(
                                  color:
                                      EscolhasController.horarioSelecionado[0]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.horarioSelecionado[0]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.horarioSelecionado[0]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                              Text(
                                'AM',
                                style: TextStyle(
                                  color:
                                      EscolhasController.horarioSelecionado[0]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.horarioSelecionado[0]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.horarioSelecionado[0]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          EscolhasController.horarioSelecionado = [
                            false,
                            false,
                            false,
                            false,
                            false,
                          ];
                          EscolhasController.horarioSelecionado[1] = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: EscolhasController.horarioSelecionado[1]
                              ? corSelecionado1
                              : corNaoSelecionado1,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '12:00',
                                style: TextStyle(
                                  color:
                                      EscolhasController.horarioSelecionado[1]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.horarioSelecionado[1]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.horarioSelecionado[1]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                              Text(
                                'AM',
                                style: TextStyle(
                                  color:
                                      EscolhasController.horarioSelecionado[1]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.horarioSelecionado[1]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.horarioSelecionado[1]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          EscolhasController.horarioSelecionado = [
                            false,
                            false,
                            false,
                            false,
                            false,
                          ];
                          EscolhasController.horarioSelecionado[2] = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: EscolhasController.horarioSelecionado[2]
                              ? corSelecionado1
                              : corNaoSelecionado1,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '02:00',
                                style: TextStyle(
                                  color:
                                      EscolhasController.horarioSelecionado[2]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.horarioSelecionado[2]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.horarioSelecionado[2]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                              Text(
                                'PM',
                                style: TextStyle(
                                  color:
                                      EscolhasController.horarioSelecionado[2]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.horarioSelecionado[2]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.horarioSelecionado[2]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          EscolhasController.horarioSelecionado = [
                            false,
                            false,
                            false,
                            false,
                            false,
                          ];
                          EscolhasController.horarioSelecionado[3] = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: EscolhasController.horarioSelecionado[3]
                              ? corSelecionado1
                              : corNaoSelecionado1,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '03:00',
                                style: TextStyle(
                                  color:
                                      EscolhasController.horarioSelecionado[3]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.horarioSelecionado[3]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.horarioSelecionado[3]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                              Text(
                                'PM',
                                style: TextStyle(
                                  color:
                                      EscolhasController.horarioSelecionado[3]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.horarioSelecionado[3]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.horarioSelecionado[3]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          EscolhasController.horarioSelecionado = [
                            false,
                            false,
                            false,
                            false,
                            false,
                          ];
                          EscolhasController.horarioSelecionado[4] = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: EscolhasController.horarioSelecionado[4]
                              ? corSelecionado1
                              : corNaoSelecionado1,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '04:00',
                                style: TextStyle(
                                  color:
                                      EscolhasController.horarioSelecionado[4]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.horarioSelecionado[4]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.horarioSelecionado[4]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                              Text(
                                'PM',
                                style: TextStyle(
                                  color:
                                      EscolhasController.horarioSelecionado[4]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.horarioSelecionado[4]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.horarioSelecionado[4]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Lembrete',
                    style: TextStyle(
                      color: Cores.cinzaTexto,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          EscolhasController.lembreteSelecionado = [
                            false,
                            false,
                            false,
                            false,
                            false,
                          ];
                          EscolhasController.lembreteSelecionado[0] = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: EscolhasController.lembreteSelecionado[0]
                              ? corSelecionado1
                              : corNaoSelecionado1,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '10',
                                style: TextStyle(
                                  color:
                                      EscolhasController.lembreteSelecionado[0]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.lembreteSelecionado[0]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.lembreteSelecionado[0]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                              Text(
                                'Min',
                                style: TextStyle(
                                  color:
                                      EscolhasController.lembreteSelecionado[0]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.lembreteSelecionado[0]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.lembreteSelecionado[0]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          EscolhasController.lembreteSelecionado = [
                            false,
                            false,
                            false,
                            false,
                            false,
                          ];
                          EscolhasController.lembreteSelecionado[1] = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: EscolhasController.lembreteSelecionado[1]
                              ? corSelecionado1
                              : corNaoSelecionado1,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '20',
                                style: TextStyle(
                                  color:
                                      EscolhasController.lembreteSelecionado[1]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.lembreteSelecionado[1]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.lembreteSelecionado[1]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                              Text(
                                'Min',
                                style: TextStyle(
                                  color:
                                      EscolhasController.lembreteSelecionado[1]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.lembreteSelecionado[1]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.lembreteSelecionado[1]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          EscolhasController.lembreteSelecionado = [
                            false,
                            false,
                            false,
                            false,
                            false,
                          ];
                          EscolhasController.lembreteSelecionado[2] = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: EscolhasController.lembreteSelecionado[2]
                              ? corSelecionado1
                              : corNaoSelecionado1,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '30',
                                style: TextStyle(
                                  color:
                                      EscolhasController.lembreteSelecionado[2]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.lembreteSelecionado[2]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.lembreteSelecionado[2]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                              Text(
                                'Min',
                                style: TextStyle(
                                  color:
                                      EscolhasController.lembreteSelecionado[2]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.lembreteSelecionado[2]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.lembreteSelecionado[2]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          EscolhasController.lembreteSelecionado = [
                            false,
                            false,
                            false,
                            false,
                            false,
                          ];
                          EscolhasController.lembreteSelecionado[3] = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: EscolhasController.lembreteSelecionado[3]
                              ? corSelecionado1
                              : corNaoSelecionado1,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '40',
                                style: TextStyle(
                                  color:
                                      EscolhasController.lembreteSelecionado[3]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.lembreteSelecionado[3]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.lembreteSelecionado[3]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                              Text(
                                'Min',
                                style: TextStyle(
                                  color:
                                      EscolhasController.lembreteSelecionado[3]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.lembreteSelecionado[3]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.lembreteSelecionado[3]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          EscolhasController.lembreteSelecionado = [
                            false,
                            false,
                            false,
                            false,
                            false,
                          ];
                          EscolhasController.lembreteSelecionado[4] = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: EscolhasController.lembreteSelecionado[4]
                              ? corSelecionado1
                              : corNaoSelecionado1,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '50',
                                style: TextStyle(
                                  color:
                                      EscolhasController.lembreteSelecionado[4]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.lembreteSelecionado[4]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.lembreteSelecionado[4]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                              Text(
                                'Min',
                                style: TextStyle(
                                  color:
                                      EscolhasController.lembreteSelecionado[4]
                                          ? corSelecionado2
                                          : corNaoSelecionado2,
                                  fontSize:
                                      EscolhasController.lembreteSelecionado[4]
                                          ? fontSelecionado
                                          : fontNaoSelecionado,
                                  fontWeight:
                                      EscolhasController.lembreteSelecionado[4]
                                          ? weightSelecionado
                                          : weightNaoSelecionado,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Cores.preto,
                  fixedSize: Size(widthTela, 64),
                ),
                onPressed: () => popUp(),
                child: Text(
                  'Confirmar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Cores.branco,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
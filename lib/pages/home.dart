// Descomentar variavel args
//Trocar o nome do usuário
//Trocar ips
//Terminar controllers do médicos
//Gerar médicos via api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ortoclinica/widgets/card_icone.dart';
import 'package:ortoclinica/widgets/card_medico.dart';
import 'package:ortoclinica/widgets/header_card.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class DadosUserLogado {
  final String nome;
  final String token;

  DadosUserLogado(this.nome, this.token);
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as DadosUserLogado;
    LatLng localizacaoOrtoclinica = const LatLng(-22.2214069, -49.9445558);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.dataset_outlined,
                          color: Color(0xFF9BC0BB),
                          size: 24,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Início',
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
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'args.nome',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Icon(
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
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: HeaderCard(titulo: 'Doutores em destaque', id: 2),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      const CardMedico(
                        nota: '4.8',
                        img: 'assets/doutor1.png',
                        nome: 'Dr. Keniti',
                        preco: '25.00',
                      ),
                      Container(width: 12),
                      const CardMedico(
                        nota: '3.0',
                        img: 'assets/doutor2.png',
                        nome: 'Dr. Strain',
                        preco: '22.00',
                      ),
                      Container(width: 12),
                      const CardMedico(
                        nota: '2.9',
                        img: 'assets/doutor3.png',
                        nome: 'Dr. Lachinet',
                        preco: '29.00',
                      ),
                      Container(width: 12),
                      const CardMedico(
                        nota: '3.0',
                        img: 'assets/doutor4.png',
                        nome: 'Dra. Crick',
                        preco: '25.00',
                      ),
                      Container(width: 12),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child:
                    HeaderCard(titulo: 'Funcionalidades da Ortoclínica', id: 1),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardIcone(
                    icone: Icons.group_outlined,
                    texto: 'Doutores',
                    id: 1,
                  ),
                  CardIcone(
                    icone: Icons.calendar_month_outlined,
                    texto: 'Agendar',
                    id: 2,
                  ),
                  CardIcone(
                    icone: Icons.credit_card_outlined,
                    texto: 'Pagamentos',
                    id: 3,
                  ),
                  CardIcone(
                    icone: Icons.airplane_ticket_outlined,
                    texto: 'Consultas',
                    id: 4,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      markers: {
                        Marker(
                          markerId: const MarkerId('Clinica'),
                          position: localizacaoOrtoclinica,
                        ),
                      },
                      initialCameraPosition: CameraPosition(
                        target: localizacaoOrtoclinica,
                        zoom: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Image.asset('assets/logo.png'),
            ],
          ),
        ),
      ),
    );
  }
}

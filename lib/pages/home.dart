import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ortoclinica/controllers/home.dart';
import 'package:ortoclinica/styles/cores.dart';
import 'package:ortoclinica/widgets/card_icone.dart';
import 'package:ortoclinica/widgets/card_medico.dart';
import 'package:ortoclinica/widgets/header_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    LatLng loc = const LatLng(-22.2214069, -49.9445558);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: HomeController.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List data = snapshot.data as List;

              return SingleChildScrollView(
                child: Container(
                  width: width,
                  height: height,
                  color: Cores.branco,
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
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'args.nome',
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
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child:
                            HeaderCard(titulo: 'Doutores em destaque', id: 2),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              for (var medico in data)
                                Row(
                                  children: [
                                    CardMedico(
                                      nota: medico['estrelas'].toString(),
                                      img: medico['img_url'].replaceAll(
                                        'localhost:',
                                        'http://26.101.238.208:',
                                      ),
                                      nome: medico['nome'],
                                      preco: '${medico['preco']},00',
                                    ),
                                    Container(width: 20),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: HeaderCard(
                          titulo: 'Funcionalidades da Ortoclínica',
                          id: 1,
                        ),
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
                          height: height * .33,
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
                                  position: loc,
                                ),
                              },
                              initialCameraPosition: CameraPosition(
                                target: loc,
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
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao buscar dados do usuário'),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

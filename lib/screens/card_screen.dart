import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:med_app/models/pacient.dart';
import 'package:med_app/screens/diagnosis_form.dart';
import 'package:med_app/widgets/bottom_panel.dart';
import 'package:med_app/widgets/diagnosis_card.dart';
import 'package:med_app/widgets/drawer.dart';
import 'package:med_app/widgets/text_tile.dart';

class CardScreen extends StatefulWidget {
  CardScreen({Key? key}) : super(key: key);

  static const name = '/card';

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  BottomDrawerController controller = BottomDrawerController();

  @override
  Widget build(BuildContext context) {
    final Pacient pacient = ModalRoute.of(context)!.settings.arguments as Pacient;
    const topPadding = 20.0;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              pacient.image ?? 'assets/default.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              fit: BoxFit.cover
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topPadding),
                topRight: Radius.circular(topPadding)
              ),
              color: Colors.white
            ),
            padding: const EdgeInsets.only(
              top: topPadding
            ),
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.width + topPadding + 10,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(pacient.fullName),
                        Text(pacient.birthString),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(153, 153, 153, 0.08),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              children: [
                                TextTile(
                                  icon: pacient.sex == Sex.male ? Icons.male : Icons.female, 
                                  title: 'Пол', 
                                  subtitle: pacient.sexTitle
                                ),
                                TextTile(
                                  icon: Icons.place, 
                                  title: 'Адрес проживания', 
                                  subtitle: pacient.address
                                ),
                              ]
                            ),
                          ),
                        ),
                        DiagnosisCard(
                          diagnosises: pacient.diagnoses,
                          controller: controller
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  child: BottomPanel(
                    text: 'Добавить диагноз',
                    onTap: () {
                      Navigator.pushNamed(
                        context, 
                        DiagnosisForm.name, 
                        arguments: {
                          'id': pacient.id
                        }
                      );
                    },
                  ),
                )
              ]
            ),
          ),
          NavDrawer(
            controller: controller,
          )
        ],
      ),
    );
  }
}

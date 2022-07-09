import 'package:flutter/material.dart';
import 'package:med_app/models/pacient.dart';
import 'package:med_app/widgets/bottom_panel.dart';
import 'package:med_app/widgets/diagnosis_card.dart';
import 'package:med_app/widgets/text_tile.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  static const name = '/card';

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
                Text(pacient.fullName),
                Text(pacient.birthString),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(153, 153, 153, 0.08)
                  ),
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0
                  ),
                  child: Column(
                    children: [
                      TextTile(
                        icon: pacient.sex == Sex.male ? Icons.male : Icons.female, 
                        title: 'Пол', 
                        subtitle: pacient.sexTitle
                      ),
                      TextTile(
                        icon: pacient.sex == Sex.male ? Icons.male : Icons.female, 
                        title: 'Адрес проживания', 
                        subtitle: pacient.address
                      ),
                    ]
                  ),
                ),
                DiagnosisCard(
                  diagnosises: pacient.diagnoses
                ),
                const BottomPanel(
                  text: 'Добавить диагноз'
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}

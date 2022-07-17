import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_app/cubit/pacient_cubit.dart';
import 'package:med_app/models/diagnosis.dart';
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
  Diagnosis? diagnosis;

  void setDiasnosis(Diagnosis e) {
    setState(() {
      diagnosis = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pacientId = ModalRoute.of(context)!.settings.arguments as String;
    const topPadding = 20.0;

    return BlocBuilder<PacientCubit, PacientState>(
      buildWhen: (previous, current) {
        return previous.pacients != current.pacients;
      },
      builder: (context, state) {
        final pacient = state.pacients.where((e) => e.id == pacientId).toList()[0];

        return Scaffold(
          body: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset(pacient.image ?? 'assets/default.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(topPadding),
                        topRight: Radius.circular(topPadding)),
                    color: Colors.white),
                padding: const EdgeInsets.only(top: topPadding),
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.width +
                    topPadding +
                    10,
                child: Column(children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    pacient.fullName,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                      height: 1.27,
                                      letterSpacing: 0.374,
                                      color: Colors.black
                                    )
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    pacient.birthString,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(153, 153, 153, 1)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(153, 153, 153, 0.08),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              //margin: const EdgeInsets.all(5.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, 
                                  vertical: 10.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Column(children: [
                                  TextTile(
                                      icon: pacient.sex == Sex.male
                                          ? Icons.male
                                          : Icons.female,
                                      title: 'Пол',
                                      subtitle: pacient.sexTitle),
                                  TextTile(
                                      icon: Icons.place,
                                      title: 'Адрес проживания',
                                      subtitle: pacient.address),
                                ]),
                              ),
                            ),
                            DiagnosisCard(
                                diagnosises: pacient.diagnoses,
                                controller: controller,
                                callback: setDiasnosis),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: BottomPanel(
                      text: 'Добавить диагноз',
                      onTap: () {
                        Navigator.pushNamed(context, DiagnosisForm.name,
                            arguments: {'id': pacient.id});
                      },
                    ),
                  )
                ]),
              ),
              NavDrawer(
                controller: controller,
                id: pacient.id,
                diagnosis: diagnosis,
              )
            ],
          ),
        );
      },
    );
  }
}

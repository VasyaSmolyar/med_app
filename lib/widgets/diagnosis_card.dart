import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:med_app/models/diagnosis.dart';

class DiagnosisCard extends StatelessWidget {
  DiagnosisCard({
    Key? key,
    required this.diagnosises
  }) : super(key: key);

  final List<Diagnosis> diagnosises;
  final BottomDrawerController controller = BottomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Диагнозы'),
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(153, 153, 153, 0.08),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: 
              diagnosises.map((e) { 
                return GestureDetector(
                  onTap: (() {
                    controller.open();
                  }),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.title),
                        const RotationTransition(
                          turns: AlwaysStoppedAnimation(-90 / 360),
                          child: Icon(Icons.arrow_back_ios, size: 15,)
                        )
                      ],
                    ),
                  ),
                );  
              }).toList(),
          ),
        ),
      ],
    );
  }
}

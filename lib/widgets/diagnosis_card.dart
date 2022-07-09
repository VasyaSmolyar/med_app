import 'package:flutter/material.dart';
import 'package:med_app/models/diagnosis.dart';

class DiagnosisCard extends StatelessWidget {
  const DiagnosisCard({
    Key? key,
    required this.diagnosises
  }) : super(key: key);

  final List<Diagnosis> diagnosises;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Диагнозы'),
        Container(
          child: Column(
            children: 
              diagnosises.map((e) { 
                return Row(
                  children: [
                    Text(e.title),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                );  
              }).toList(),
          ),
        )
      ],
    );
  }
}

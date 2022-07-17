import 'package:flutter/material.dart';
import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_app/cubit/pacient_cubit.dart';
import 'package:med_app/models/diagnosis.dart';
import 'package:med_app/screens/diagnosis_form.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    Key? key,
    required this.controller,
    required this.id,
    required this.diagnosis
  }) : super(key: key);

  final BottomDrawerController controller;
  final String id;
  final Diagnosis? diagnosis;

  @override
  Widget build(BuildContext context) {
    return BottomDrawer(
      header: Container(
        height: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.edit_note),
                  title: const Text('Изменить диагноз'),
                  onTap: () {
                    print(diagnosis!.id);

                    Navigator.pushNamed(
                        context, 
                        DiagnosisForm.name, 
                        arguments: {
                          'id': id,
                          'diagnosisId': diagnosis!.id
                        }
                      );
                    },
                ),
                ListTile(
                  leading: const Icon(Icons.delete_outlined,),
                  title: const Text(
                    'Удалить диагноз'
                  ),
                  textColor: Colors.red,
                  iconColor: Colors.red,
                  onTap: () {
                    BlocProvider.of<PacientCubit>(context).deleteDiagnosis(
                      id: id, 
                      diagnosisId: diagnosis!.id
                    );
                  },
                )
              ]
            ),
          ),
        ),
      ),
      headerHeight: 0.0,
      drawerHeight: MediaQuery.of(context).size.height,
      color: const Color.fromRGBO(0, 0, 0, 0.4),
      controller: controller,
    );
  }
}

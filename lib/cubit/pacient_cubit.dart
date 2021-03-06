import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:med_app/helpers/sample_data.dart';
import 'package:med_app/models/diagnosis.dart';
import 'package:med_app/models/pacient.dart';

part 'pacient_state.dart';

class PacientCubit extends Cubit<PacientState> {
  PacientCubit() : super(PacientState.empty());

  void add({
    required String firstName,
    required String lastName,
    required String secondName,
    String? image,
    required DateTime birthDay,
    required String sex,
    required String address,
  }) {
    List<Pacient> pacients = state.pacients;
    pacients.add(Pacient(
      id: UniqueKey().toString(), 
      firstName: 
      firstName, 
      lastName: lastName, 
      secondName: secondName, 
      birthDay: birthDay, 
      sex: Pacient.sexFrom(sex), 
      address: address, 
      diagnoses: []
    ));

    emit(
      PacientState(pacients)
    );
  }

  void delete({
    required String id
  }) {
    emit(
      PacientState(
        state.pacients.where((e) => e.id != id).toList()
      )
    );
  }

  void addDiagnosis({
    required String id,
    required String title
  }) {
    final pacients = state.pacients;

    emit(
      PacientState(pacients.map((e) {
        if(e.id != id) {
          return e;
        }

        List<Diagnosis> diagnoses = e.diagnoses;
        diagnoses.add(Diagnosis(
          id: UniqueKey().toString(),
          title: title
        )); 

        return e.copyWith(
          diagnoses: diagnoses
        );
      }).toList())
    );
  }

  void editDiagnosis({
    required String id,
    required String diagnosisId,
    required String title
  }) {
    final pacients = state.pacients;

    emit(
      PacientState(pacients.map((e) {
        if(e.id != id) {
          return e;
        }

        List<Diagnosis> diagnoses = e.diagnoses.map((ei) {
          if(ei.id != diagnosisId) {
            return ei;
          }

          return Diagnosis(id: diagnosisId, title: title);
        }).toList();

        return e.copyWith(
          diagnoses: diagnoses
        );
      }).toList())
    );
  }

  void deleteDiagnosis({
    required String id,
    required String diagnosisId
  }) {
    final pacients = state.pacients;

    emit(
      PacientState(pacients.map((e) {
        if(e.id != id) {
          return e;
        }

        List<Diagnosis> diagnoses = e.diagnoses.where((el) => el.id != diagnosisId).toList();

        return e.copyWith(
          diagnoses: diagnoses
        );
      }).toList())
    );
  }
}

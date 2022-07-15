import 'package:bloc/bloc.dart';
import 'package:med_app/helpers/sample_data.dart';
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
      id: pacients.length.toString(), 
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
}

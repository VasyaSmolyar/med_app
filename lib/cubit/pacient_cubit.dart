import 'package:bloc/bloc.dart';
import 'package:med_app/helpers/sample_data.dart';
import 'package:med_app/models/pacient.dart';
import 'package:meta/meta.dart';

part 'pacient_state.dart';

class PacientCubit extends Cubit<PacientState> {
  PacientCubit() : super(PacientState.empty());


}

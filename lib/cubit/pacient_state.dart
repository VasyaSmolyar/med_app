part of 'pacient_cubit.dart';

@immutable
class PacientState {
  PacientState.empty() : this(sampleData);

  const PacientState(this.pacients);

  final List<Pacient> pacients;
}

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PacientFormBloc extends FormBloc<String, String> {
  final firstName = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final lastName = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final secondName = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final sex = SelectFieldBloc(
    name: 'sex',
    items: ['Мужчина', 'Женщина'],
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final birthDate = InputFieldBloc<DateTime?, Object>(
    name: 'birthDate',
    initialValue: null,
    toJson: (value) => value!.toUtc().toIso8601String(),
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final address = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  PacientFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        firstName,
        lastName,
        secondName,
        sex,
        birthDate,
        address,
      ],
    );
  }

  @override
  void onSubmitting() async {
    emitSuccess();
  }
}

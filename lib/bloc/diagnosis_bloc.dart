import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class DiagnosisBloc extends FormBloc<String, String> {

  final title = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  DiagnosisBloc() {
    addFieldBlocs(
      fieldBlocs: [
        title
      ],
    );
  }

  @override
  void onSubmitting() async {
    emitSuccess();
  }
}

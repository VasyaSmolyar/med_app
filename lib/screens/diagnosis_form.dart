import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:med_app/bloc/diagnosis_bloc.dart';
import 'package:med_app/cubit/pacient_cubit.dart';
import 'package:med_app/widgets/bottom_panel.dart';

class DiagnosisForm extends StatelessWidget {
  const DiagnosisForm({Key? key}) : super(key: key);

  static const name = '/diagnosis';

  @override
  Widget build(BuildContext context) {
    final id = (ModalRoute.of(context)!.settings.arguments as Map<String, String>)['id']!;
    final diagnosisId = (ModalRoute.of(context)!.settings.arguments as Map<String, String>)['diagnosisId'];

    return BlocProvider(
      create: (context) => DiagnosisBloc(),
      child: Builder(
        builder: (ctx) {
          final formBloc = ctx.read<DiagnosisBloc>();

          return FormBlocListener<DiagnosisBloc, String, String>(
              onSubmitting: (context, state) {
              },
              onSubmissionFailed: (context, state) {
              },
              onSuccess: (context, state) {
                if(diagnosisId != null) {
                  BlocProvider.of<PacientCubit>(context).editDiagnosis(
                    id: id, 
                    diagnosisId: diagnosisId,
                    title: formBloc.title.value
                  );
                } else {
                  BlocProvider.of<PacientCubit>(context).addDiagnosis(
                    id: id, 
                    title: formBloc.title.value
                  );
                }
                
                Navigator.pop(context);
              },
              onFailure: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.failureResponse!)));
              },
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: AutofillGroup(
                    child: Column(
                      children: <Widget>[
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.title,
                          decoration: const InputDecoration(
                            labelText: 'Диагноз',
                          ),
                        ),
                        BottomPanel(
                          text: 'Сохранить', 
                          onTap: formBloc.submit
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
        }
      )
    );
  }
}

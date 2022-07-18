import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:med_app/bloc/diagnosis_bloc.dart';
import 'package:med_app/cubit/pacient_cubit.dart';
import 'package:med_app/widgets/bottom_panel.dart';
import 'package:med_app/widgets/text_header.dart';

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
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const TextHeader(
                            header: 'Диагноз'
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(top: 25),
                                decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), spreadRadius: 0.5)
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)
                                ),
                                color: Colors.white
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Column(
                                  children: [
                                    TextFieldBlocBuilder(
                                      textFieldBloc: formBloc.title,
                                      decoration: const InputDecoration(
                                        labelText: 'Диагноз',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
              ),
            );
        }
      )
    );
  }
}

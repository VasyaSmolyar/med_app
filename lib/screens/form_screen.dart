import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:med_app/bloc/pacient_form_bloc.dart';
import 'package:med_app/cubit/pacient_cubit.dart';
import 'package:med_app/widgets/bottom_panel.dart';
import 'package:med_app/widgets/text_header.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  static const name = '/form';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PacientFormBloc(),
      child: Builder(
        builder: (ctx) {
          final loginFormBloc = ctx.read<PacientFormBloc>();

          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: FormBlocListener<PacientFormBloc, String, String>(
              onSubmitting: (context, state) {
              },
              onSubmissionFailed: (context, state) {
              },
              onSuccess: (context, state) {
                BlocProvider.of<PacientCubit>(context).add( 
                  firstName: loginFormBloc.firstName.value, 
                  lastName: loginFormBloc.lastName.value, 
                  secondName: loginFormBloc.secondName.value, 
                  birthDay: loginFormBloc.birthDate.value!, 
                  sex: loginFormBloc.sex.value!, 
                  address: loginFormBloc.address.value,
                );
                
                Navigator.pop(context);
              },
              onFailure: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.failureResponse!)));
              },
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const TextHeader(
                        header: 'Новый пациент'
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: [
                                TextFieldBlocBuilder(
                                  textFieldBloc: loginFormBloc.lastName,
                                  decoration: const InputDecoration(
                                    labelText: 'Фамилия',
                                  ),
                                  
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: loginFormBloc.firstName,
                                  decoration: const InputDecoration(
                                    labelText: 'Имя',
                                  ),
                                  
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: loginFormBloc.secondName,
                                  decoration: const InputDecoration(
                                    labelText: 'Отчество',
                                  ),
                                  
                                ),
                                DropdownFieldBlocBuilder<String>(
                                  selectFieldBloc: loginFormBloc.sex,
                                  decoration: const InputDecoration(
                                    labelText: 'Пол',
                                  ),
                                  itemBuilder: (ctx, value) => FieldItem(
                                    child: Text(value),
                                  ),
                                ),
                                DateTimeFieldBlocBuilder(
                                  decoration: const InputDecoration(
                                    labelText: 'Возраст',
                                  ),
                                  dateTimeFieldBloc: loginFormBloc.birthDate,
                                  format: DateFormat('dd-MM-yyyy'),
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2030),
                                ),
                                TextFieldBlocBuilder(
                                  textFieldBloc: loginFormBloc.address,
                                  decoration: const InputDecoration(
                                    labelText: 'Адрес проживания',
                                  ),
                                  autofillHints: const [
                                    AutofillHints.username,
                                  ]
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      BottomPanel(
                        text: 'Сохранить', 
                        onTap: loginFormBloc.submit
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

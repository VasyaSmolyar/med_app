import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:med_app/bloc/pacient_form_bloc.dart';
import 'package:med_app/cubit/pacient_cubit.dart';
import 'package:med_app/widgets/bottom_panel.dart';

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
            appBar: AppBar(title: const Text('Login')),
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
                child: AutofillGroup(
                  child: Column(
                    children: <Widget>[
                      TextFieldBlocBuilder(
                        textFieldBloc: loginFormBloc.lastName,
                        decoration: const InputDecoration(
                          labelText: 'Фамилия',
                        ),
                        autofillHints: const [
                          AutofillHints.username,
                        ]
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: loginFormBloc.firstName,
                        decoration: const InputDecoration(
                          labelText: 'Имя',
                        ),
                        autofillHints: const [
                          AutofillHints.username,
                        ]
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: loginFormBloc.secondName,
                        decoration: const InputDecoration(
                          labelText: 'Отчество',
                        ),
                        autofillHints: const [
                          AutofillHints.username,
                        ]
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

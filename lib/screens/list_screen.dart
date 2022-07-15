import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_app/cubit/pacient_cubit.dart';
import 'package:med_app/screens/form_screen.dart';
import 'package:med_app/widgets/bottom_panel.dart';
import 'package:med_app/widgets/pacient_list.dart';
import 'package:med_app/widgets/text_header.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  static const name = '/';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PacientCubit, PacientState>(
      builder: (ctx, state) {
        return Scaffold(
          body: Column(
            children: [
              const TextHeader(header: 'Список пациентов'),
              Expanded(child: PacientList(pacients: state.pacients)),
              BottomPanel(
                text: 'Добавить пациента',
                onTap: () => Navigator.pushNamed(context, FormScreen.name),
              )
            ],
          ),
        );
      },
    );
  }
}

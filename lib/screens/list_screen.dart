import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_app/cubit/pacient_cubit.dart';
import 'package:med_app/widgets/bottom_panel.dart';
import 'package:med_app/widgets/pacient_list.dart';
import 'package:med_app/widgets/text_header.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  static const name = '/';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PacientCubit, PacientState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 100,
                child: TextHeader(header: 'Список пациентов')
              ),
              Expanded(child: PacientList(pacients: state.pacients)),
              const SizedBox(
                height: 100,
                child: BottomPanel(text: 'Добавить пациента')
              )
            ],
          ),
        );
      },
    );
  }
}

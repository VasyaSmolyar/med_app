import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_app/cubit/pacient_cubit.dart';
import 'package:med_app/screens/card_screen.dart';
import 'package:med_app/screens/form_screen.dart';
import 'package:med_app/screens/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PacientCubit(),
      child: MaterialApp(
        title: 'Med app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }
          )
        ),
        initialRoute: ListScreen.name,
        routes: {
          ListScreen.name: (context) => const ListScreen(),
          CardScreen.name: (context) => const CardScreen(),
          FormScreen.name: (context) => const FormScreen()
        },
      ),
    );
  }
}

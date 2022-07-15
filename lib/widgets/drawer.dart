import 'package:flutter/material.dart';
import 'package:bottom_drawer/bottom_drawer.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    Key? key,
    required this.controller
  }) : super(key: key);

  final BottomDrawerController controller;

  @override
  Widget build(BuildContext context) {
    return BottomDrawer(
      header: Container(
        height: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.edit_note),
                  title: const Text('Изменить диагноз'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.delete_outlined,),
                  title: const Text(
                    'Удалить диагноз'
                  ),
                  textColor: Colors.red,
                  iconColor: Colors.red,
                  onTap: () {},
                )
              ]
            ),
          ),
        ),
      ),
      headerHeight: 0.0,
      drawerHeight: MediaQuery.of(context).size.height,
      color: const Color.fromRGBO(0, 0, 0, 0.4),
      controller: controller,
    );
  }
}

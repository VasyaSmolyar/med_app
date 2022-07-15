import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:med_app/models/pacient.dart';
import 'package:med_app/screens/card_screen.dart';

class PacientList extends StatelessWidget {
  const PacientList({
    Key? key,
    required this.pacients 
  }) : super(key: key);

  final List<Pacient> pacients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pacients.length,
      itemBuilder: (BuildContext context, int index) {
        return Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: () {}),
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),

          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, CardScreen.name, arguments: pacients[index]),
            child: ListTile(
              leading: Image.asset(
                pacients[index].image ?? 'assets/default.png',
                width: 40,
                height: 40,
              ),
              subtitle: Text(pacients[index].birthString),
              title: Text(pacients[index].initials),
              trailing: const Icon(Icons.more_vert),
            ),
          ),
        );
      }
    );
  }
}

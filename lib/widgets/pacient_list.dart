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
    const topPadding = 25.0;

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), spreadRadius: 0.5)
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topPadding),
          topRight: Radius.circular(topPadding)
        ),
        color: Colors.white
      ),
      //padding: const EdgeInsets.only(top: topPadding),
      child: ListView.builder(
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
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Color.fromRGBO(0, 0, 0, 0.1)),
                  ),
                ),
                child: ListTile(
                  leading: Image.asset(
                    pacients[index].image ?? 'assets/default.png',
                    width: 40,
                    height: 40,
                  ),
                  subtitle: Text(pacients[index].birthString),
                  title: Text(pacients[index].initials),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({
    Key? key,
    required this.text,
    required this.onTap
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontFamily: 'Muller',
      fontWeight: FontWeight.w500,
      fontSize: 15,
      //height: 16,
      letterSpacing: 1.25,
      color: Colors.white,
    );

    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0, bottom: 50.0),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Color.fromRGBO(0, 0, 0, 0.5)),
        ),
      ),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 80),
            primary: const Color.fromRGBO(255, 17, 70, 1),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25)
              )
            ),
            textStyle: style
          ),
          child: Text(
            textAlign: TextAlign.center,
            text.toUpperCase(),
            //style: style,
          ),
        ),
      )
    );
  }
}

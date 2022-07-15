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
      //font-family: 'Muller',
      fontWeight: FontWeight.w500,
      fontSize: 15,
      height: 16,
      letterSpacing: 1.24975,
      color: Colors.white
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      height: 100,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Color.fromRGBO(0, 0, 0, 0.5)),
        ),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          textAlign: TextAlign.center,
          text.toUpperCase(),
          style: style,
        ),
      )
    );
  }
}

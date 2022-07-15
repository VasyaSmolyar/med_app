import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({
    Key? key,
    required this.header
  }) : super(key: key);

  final String header;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Text(
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'Muller',
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        header
      ),
    );
  }
}

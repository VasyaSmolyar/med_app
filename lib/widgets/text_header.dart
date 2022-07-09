import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({
    Key? key,
    required this.header
  }) : super(key: key);

  final String header;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      header
    );
  }
}

import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  const TextTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Column(
          children: [
            Text(title),
            Text(subtitle)
          ],
        )
      ],
    );
  }
}

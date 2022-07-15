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

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(icon, size: 25, color: const Color.fromRGBO(153, 153, 153, 1)),
            ),
            Text(
              title,
              style: const TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
              textAlign: TextAlign.center
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0,),
                child: Icon(icon, size: 25, color: Colors.transparent,),
              ),
              Flexible(
                child: Text(
                  subtitle,
                  maxLines: 2,
                  //textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

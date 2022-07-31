import 'package:flutter/material.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({Key? key,required this.title}) : super(key: key);
  final String title;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
            title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: (const Icon(
              Icons.cast,
              color: Colors.white,
              size: 30,
            ))),
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Calculator',
          style: TextStyle(color: Colors.grey[200], fontSize: 40),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'IMC',
          style: TextStyle(
              color: Colors.deepPurple[400],
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeightContainer extends StatelessWidget {
  double altura;
  Function(double) onChanged;

  HeightContainer({super.key, required this.altura, required this.onChanged});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 19, 18, 18),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            'Altura',
            style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '$altura m',
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Slider(
              min: 0.0,
              max: 3.20,
              value: altura,
              activeColor: Colors.grey[600],
              thumbColor: Colors.deepPurple[400],
              onChanged: onChanged),
        ],
      ),
    );
  }
}

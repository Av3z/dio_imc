import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Function() onPressed;

  CustomButton({super.key, required this.onPressed});

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              backgroundColor:
                  MaterialStatePropertyAll(Colors.deepPurple[400])),
          onPressed: onPressed,
          child: Text(
            'Calcular',
            style: TextStyle(
                color: Colors.grey[200],
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}

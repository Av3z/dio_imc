import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardAddRemove extends StatelessWidget {
  double qtd;
  String text;
  Function() addNumber;
  Function() removeNumber;

  CardAddRemove(
      {super.key,
      required this.qtd,
      required this.text,
      required this.addNumber,
      required this.removeNumber});

  @override
  Widget build(context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 19, 18, 18),
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              qtd.round().toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.grey[700])),
                    onPressed: removeNumber,
                    icon: const Icon(Icons.remove)),
                IconButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.grey[700])),
                    onPressed: addNumber,
                    icon: const Icon(Icons.add))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

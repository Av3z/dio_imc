import 'package:dio_imc/src/components/card_add_remove.dart';
import 'package:dio_imc/src/components/custom_button.dart';
import 'package:dio_imc/src/components/height_container.dart';
import 'package:dio_imc/src/components/logo.dart';
import 'package:dio_imc/src/models/imc.dart';
import 'package:dio_imc/src/repositories/imc_repository.dart';
import 'package:dio_imc/src/utils/imc_calculator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IMC imc = IMC();
  ImcRepository imcRepository = ImcRepository();
  List list = [];

  @override
  void initState() {
    super.initState();
    obterLista();
  }

  void obterLista() {
    list = imcRepository.getListImc();
  }

  showAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'IMC',
            ),
            content: Text(
              IMCCalculator.stringResultImc(
                  double.parse(imc.imc.toStringAsFixed(2))),
              style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    imcRepository.setImcList(imc.imc);
                    setState(() {
                      obterLista();
                    });
                  },
                  child: const Text('Salvar'))
            ],
          );
        });
  }

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 30,
          ),
          const Logo(),
          const SizedBox(
            height: 30,
          ),
          HeightContainer(
              altura: double.parse(imc.altura.toStringAsFixed(2)),
              onChanged: (value) {
                setState(() {
                  imc.altura = value;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CardAddRemove(
              qtd: imc.peso,
              text: "Peso",
              addNumber: () {
                setState(() {
                  imc.peso++;
                });
              },
              removeNumber: () {
                setState(() {
                  imc.peso--;
                });
              },
            ),
            CardAddRemove(
              qtd: double.parse(imc.idade.toString()),
              text: "Idade",
              addNumber: () {
                setState(() {
                  imc.idade++;
                });
              },
              removeNumber: () {
                setState(() {
                  imc.idade--;
                });
              },
            ),
          ]),
          const SizedBox(
            height: 50,
          ),
          CustomButton(onPressed: () {
            imc.imc = IMCCalculator.calculateImc(imc.peso, imc.altura);
            showAlert();
          }),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: imcRepository.getListImc().length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8)),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: ListTile(
                    leading: const Icon(Icons.access_alarm),
                    title: Text(IMCCalculator.stringResultImc(
                        double.parse(list[index].toStringAsFixed(2)))),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          imcRepository.removeImcList(list[index]);
                        });
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.red[300],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

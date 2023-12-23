// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio_imc/src/repositories/imc_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ImcRepository imcRepository = ImcRepository();
  imcRepository.setImcList(2.2);
  imcRepository.setImcList(4.2);
  imcRepository.setImcList(2.7);
  imcRepository.setImcList(10.28);
  test('IMC repository ', () => {expect(imcRepository.getListImc().length, 4)});
}

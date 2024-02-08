import 'package:dio_imc/src/services/storage.dart';

class ImcRepository {
  final List<double> _allIMC = [];
  Storage storage = Storage();

  void setImcList(imc) {
    _allIMC.add(imc);
  }

  void removeImcList(double imc) {
    _allIMC.remove(imc);
  }

  List<double> getListImc() {
    return _allIMC;
  }

  List<double> toListDouble(List<String> value) {
    return value.map((e) => double.tryParse(e) ?? 0.0).toList();
  }

  List<String> toListString(List<double> value) {
    return value.map((e) => e.toString()).toList();
  }

  Future saveStorage() async {
    storage.storageSave('imc', toListString(_allIMC));
  }
}

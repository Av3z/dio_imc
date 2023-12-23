class ImcRepository {
  final List<double> _allIMC = [];

  void setImcList(imc) {
    _allIMC.add(imc);
  }

  void removeImcList(double imc) {
    _allIMC.remove(imc);
  }

  List<double> getListImc() {
    return _allIMC;
  }
}

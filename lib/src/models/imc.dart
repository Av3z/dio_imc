class IMC {
  double _peso = 50.0;
  double _altura = 1.55;
  int _idade = 18;
  double _imc = 0.0;

  double get peso => _peso;
  double get altura => _altura;
  int get idade => _idade;
  double get imc => _imc;

  set imc(imc) => _imc = imc;
  set peso(peso) => _peso = peso;
  set altura(altura) => _altura = altura;
  set idade(idade) => _idade = idade;
}

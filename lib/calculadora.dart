import 'number-formatter.dart';

class Calculations {
  static const PUNTO = '.';
  static const MULTIPLICACION = 'x';
  static const RESTA = '-';
  static const ADD = '+';
  static const DIVICION = '/';
  static const LIMPIAR = 'AC';
  static const IGUAL = '=';
  static const PERCENT = "%";
  static const OPERACIONES = [
    Calculations.ADD,
    Calculations.MULTIPLICACION,
    Calculations.RESTA,
    Calculations.DIVICION,
  ];

  static double add(double a, double b) => a + b;
  static double resta(double a, double b) => a - b;
  static double divicion(double a, double b) => a / b;
  static double multiplicacion(double a, double b) => a  * b;
  static double porcentaje(double a) => a / 100;
}

class Calculator {
  static String parseString(String text) {
    List<String> addNumeros;
    double a, b, resultado;
    if (text.contains(Calculations.ADD)) {
      addNumeros = text.split(Calculations.ADD);
      a = double.parse(addNumeros[0]);
      b = double.parse(addNumeros[1]);
      resultado = Calculations.add(a, b);

    } else if (text.contains(Calculations.MULTIPLICACION)) {
      addNumeros = text.split(Calculations.MULTIPLICACION);
      a = double.parse(addNumeros[0]);
      b = double.parse(addNumeros[1]);
      resultado = Calculations.multiplicacion(a, b);

    } else if (text.contains(Calculations.DIVICION)) {
      addNumeros = text.split(Calculations.DIVICION);
      a = double.parse(addNumeros[0]);
      b = double.parse(addNumeros[1]);
      resultado = Calculations.divicion(a, b);

    } else if (text.contains(Calculations.RESTA)) {
      addNumeros = text.split(Calculations.RESTA);
      a = double.parse(addNumeros[0]);
      b = double.parse(addNumeros[1]);
      resultado = Calculations.resta(a, b);

    } else if (text.contains(Calculations.PERCENT)){
      addNumeros = text.split(Calculations.PERCENT);
      a = double.parse(addNumeros[0]);
      resultado = Calculations.porcentaje(a);

    } else {
      return text;
    }
    return NumberFormatter.format(resultado.toString());
  }

  static String addPunto(String calcText) {
    if (calcText.isEmpty) {
      return calcText = '0${Calculations.PUNTO}';
    }
    RegExp exp = new RegExp(r"\d\.");
    Iterable<Match> matches = exp.allMatches(calcText);
    int maxMatches = Calculator.existeOperador(calcText) ? 2 : 1;
    return 
        matches.length == maxMatches ? calcText : calcText += Calculations.PUNTO;
  }

  static bool existeOperador(String calcText) {
    for (var operador in Calculations.OPERACIONES) {
      if (calcText.contains(operador)) {
        return true;
      }
    }
    return false;
  }
}
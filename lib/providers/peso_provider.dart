import 'package:flutter/material.dart';

class PesoProvider extends ChangeNotifier {
  String msg = '';
  int calorias = 0;
  int carbohidratos = 0;
  double grasas = 7.3;
  double proteinas = 0;
  Widget? icon;
  void getCategoriaxIMC(int peso, double estatura) {
//IMC = peso (kg)/ estatura (m2) y,
    final resultadoIMC = peso / (estatura * estatura);
    print(resultadoIMC);

    if (resultadoIMC < 18.5) {
      msg = 'Delgadez';
    } else if (resultadoIMC >= 18.5 && resultadoIMC <= 24.9) {
      msg = 'Normal';
    } else if (resultadoIMC >= 25.0 && resultadoIMC <= 29.9) {
      msg = 'Sobrepeso';
    } else if (resultadoIMC >= 30.0 && resultadoIMC <= 34.9) {
      msg = 'Obesidad I';
    } else if (resultadoIMC >= 35.0 && resultadoIMC <= 39.9) {
      msg = 'Obesidad II';
    } else {
      msg = 'Obesidad III';
    }

    notifyListeners();
  }

//desayuno
  void getCalorias(int edad) {
    if (edad >= 2 && edad <= 5) {
      calorias = 111;
    } else if (edad >= 6 && edad <= 8) {
      calorias = 373;
    } else if (edad >= 9 && edad <= 11) {
      calorias = 466;
    } else if (edad >= 12 && edad <= 14) {
      calorias = 478;
    } else if (edad >= 15 && edad <= 17) {
      calorias = 536;
    } else if (edad >= 18 && edad <= 59) {
      calorias = 513;
    } else {
      calorias = 455;
    }
    notifyListeners();
  }

  void getCarbohidratos(int peso) {
    carbohidratos = peso * 3;

    notifyListeners();
  }

  void getProteinas(int peso) {
    proteinas = peso * 1.3;
    notifyListeners();
  }

  //almuerzo;
  void getCaloriasxAlmuerzo(int edad) {
    if (edad >= 2 && edad <= 5) {
      calorias = 111;
    } else if (edad >= 6 && edad <= 8) {
      calorias = 653;
    } else if (edad >= 9 && edad <= 11) {
      calorias = 816;
    } else if (edad >= 12 && edad <= 14) {
      calorias = 888;
    } else if (edad >= 15 && edad <= 17) {
      calorias = 996;
    } else if (edad >= 18 && edad <= 59) {
      calorias = 1173;
    } else {
      calorias = 845;
    }
    notifyListeners();
  }

  //cena;
  void getCaloriasxCena(int edad) {
    if (edad >= 2 && edad <= 5) {
      calorias = 111;
    } else if (edad >= 6 && edad <= 8) {
      calorias = 373;
    } else if (edad >= 9 && edad <= 11) {
      calorias = 466;
    } else if (edad >= 12 && edad <= 14) {
      calorias = 683;
    } else if (edad >= 15 && edad <= 17) {
      calorias = 766;
    } else if (edad >= 18 && edad <= 59) {
      calorias = 513;
    } else {
      calorias = 650;
    }
    notifyListeners();
  }
}

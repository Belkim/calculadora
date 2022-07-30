import 'package:flutter/material.dart';
import 'calculadora.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String calcText = "";
  int count = 0;
  String dob = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff22252D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: size.height / 15,
                  //color: Colors.amber,
                  child: Text(
                    calcText,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          Container(
            height: size.height / 1.7,
            decoration: const BoxDecoration(
                color: Color(0xff2A2D36),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("AC", Colors.green),
                    blocks("CC", Colors.green),
                    blocks("%", Colors.green),
                    blocks("/", Colors.red)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("1"),
                    blocks("2"),
                    blocks("3"),
                    blocks("x", Colors.red)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("4"),
                    blocks("5"),
                    blocks("6"),
                    blocks("+", Colors.red)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("7"),
                    blocks("8"),
                    blocks("9"),
                    blocks("-", Colors.red)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks(":"),
                    blocks("0"),
                    blocks("."),
                    blocks("=",count==0 ? Colors.red: Colors.lightBlueAccent)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
  
  Widget blocks(String texto, [Color? color]) {
    bool isNewEquation = true;
    List<double> values = [];
    List<String> operations = [];
    List<String> calculations = [];
    return GestureDetector(
      onTap: () {
        if (texto == "AC") {
          setState(() {
            calcText = "";
          });
        } else if( texto == "."){
            calcText = Calculator.addPunto(calcText);
        } else if (texto == "=") {
          if (count == 0) {
            String newCalculatorString = Calculator.parseString(calcText);
            setState(() {
              //Realizar el cálculo
              if (newCalculatorString != calcText) {
                // agrega cadenas evaluadas a la matriz de cálculos
                calculations.add(calcText);
              }
              calcText = newCalculatorString;
              isNewEquation = false;
              if (!isNewEquation && operations.length > 0 && operations.last == Calculations.IGUAL){
                calcText = texto;
                isNewEquation = true;
              } else {
                calcText = calcText;
              }
            });
          } else {
            setState(() {
              calcText = dob;
              count -= 1;
            });
          }
        }else {
          setState(() {
            if(texto != "="){
              calcText = calcText + texto;
            }
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            color: Color(0xff22252D),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Center(
            child: Text(
              texto,
              style: TextStyle(
                  color: color ?? Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

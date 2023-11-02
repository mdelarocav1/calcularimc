import 'dart:math';
import 'package:flutter/material.dart';

class calcularIMC extends StatefulWidget {
  const calcularIMC({super.key});

  @override
  State<calcularIMC> createState() => _calcularIMCState();
}

class _calcularIMCState extends State<calcularIMC> {
  double sliderAltura = 0;
  double sliderPeso = 0;
  double valorIMC = 0;
  String tipoIMC = "";
  String textoIMC = "";
  double calcularIMC(double sliderPeso, double sliderAltura) {
    double alturaMetros = sliderAltura / 100;
    return sliderPeso / (alturaMetros * alturaMetros);
  }
  String tipoIMC2 (sliderPeso, sliderAltura){
    if (valorIMC < 18.5) {
      return tipoIMC = "Delgadez o bajo de peso";
    } else if (valorIMC > 18.5 && valorIMC < 24.9){
      return tipoIMC = "Normal";
    } else if (valorIMC > 25 && valorIMC < 29.9){
      return tipoIMC = "Sobrepeso";
    } else if (valorIMC > 30){
      return tipoIMC = "Obesidad";
    } else{
      return tipoIMC = "No se pudo determinar el IMC";
    }
  }
    String textoIMC2 (sliderPeso, sliderAltura){
    if (valorIMC < 18.5) {
      return textoIMC = "Delgadez - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque odio lorem, blandit id velit in, facilisis finibus felis. ";
    } else if (valorIMC > 18.5 && valorIMC < 24.9){
      return textoIMC = "Normal - Aenean id efficitur nisl. Phasellus scelerisque vitae velit et hendrerit. Etiam mattis mollis feugiat. ";
    } else if (valorIMC > 25 && valorIMC < 29.9){
      return textoIMC = "Sobrepeso - Aliquam viverra finibus ante, sit amet tempor dui faucibus et. Ut elementum, sem id mollis euismod, quam dolor convallis velit, in blandit enim odio non risus. ";
    } else if (valorIMC > 30){
      return textoIMC = "Obesidad - Aenean dapibus odio ac magna aliquam lacinia. Sed pretium velit elit, a efficitur elit porta a. ";
    } else{
      return textoIMC = "No se pudo determinar el IMC";
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Calcular IMC",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.red,
            elevation: 0,
            shadowColor: Colors.black,
            foregroundColor: Colors.green,
            iconTheme: IconThemeData(color: Colors.white, fill: 1.0),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                tooltip: 'Borrar todo',
                onPressed: () {
                  //Aquì debe ir la acciòn para borrar todo.
                },
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///
                      /// Bloque de Altura
                      ///
                      Text(
                        "Altura",
                        style: TextStyle(fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              sliderAltura.toStringAsFixed(1),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 48.0),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "cm",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        // Slider para Altura
                        value: sliderAltura,
                        min: 0,
                        max: 250,
                        inactiveColor: Colors.grey,
                        onChanged: (pepito) {
                          sliderAltura = pepito;
                          setState(() {});
                        },
                      ),
              
                      ///
                      /// Bloque de Peso
                      ///
                      Text(
                        "Peso",
                        style: TextStyle(fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              sliderPeso.toStringAsFixed(1),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 48.0),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "kg",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        // Slider para PEso
                        value: sliderPeso,
                        min: 0,
                        max: 500,
                        inactiveColor: Colors.grey,
                        onChanged: (pepito) {
                          sliderPeso = pepito;
                          setState(() {});
                        },
                      ),
              
                      ///
                      /// Botón Calcular
                      ///
              
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              valorIMC = calcularIMC(sliderPeso, sliderAltura);
                              setState(() {});
                              print('El IMC de la persona es: $valorIMC');

                            tipoIMC = tipoIMC2(sliderPeso, sliderAltura);
                              setState(() {});
                            textoIMC = textoIMC2(sliderPeso, sliderAltura);
                              setState(() {});
                            },

                            child: Text(
                              'Calcular',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              textStyle: TextStyle(fontSize: 18),
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ),
              
                    ///
                    /// Cálculo de IMC
                    ///
                    
                    Text(
                        valorIMC.toStringAsFixed(1),
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 48),
                        textAlign: TextAlign.center,
                      ),
                    Text(
                        tipoIMC,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0),
                      child: Text(
                          textoIMC,
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.network(
                        "https://cdn-icons-png.flaticon.com/512/4003/4003791.png"
                      ),
                    ),
              
                    ]),
              ),
            ),
          )),
    );
  }
}

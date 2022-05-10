import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController etanolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();
  String _resultado = "Informe os valores";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _reset() {
    gasolinaController.text = "";
    etanolController.text = "";
    setState(() {
      _resultado = "Informe os valores";
    });
  }

  void _calculaCombustivelIdeal() {
    double vEtanol = double.parse(etanolController.text.replaceAll(',', '.'));
    double vGasolina =
        double.parse(gasolinaController.text.replaceAll(',', '.'));
    double propocao = vEtanol / vGasolina;
    //se a proporção for menor que 0.7, deve-se abastecer com etanol. Caso contrário, gasolina
    setState(() {
      _resultado =
          (propocao <= 0.7) ? "Abasteça com Etanol" : "Abasteça com Gasolina";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Etanol ou Gasolina?',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  _reset();
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Icon(
                      Icons.local_gas_station_rounded,
                      size: 130,
                      color: Colors.lightBlue[900],
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: etanolController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe corretamente o valor do etanol";
                        } else {
                          if (double.tryParse(value) != null) {
                            if (double.parse(value.toString()) <= 0) {
                              return "O valor precisa ser positivo!";
                            }
                          }
                          return null;
                        }
                      },
                      textAlign: TextAlign.center,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          labelText: 'Valor do Etanol',
                          labelStyle: TextStyle(color: Colors.blue[900]),
                          errorStyle: const TextStyle(fontSize: 16)),
                      style:
                          TextStyle(color: Colors.lightBlue[800], fontSize: 26),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                        controller: gasolinaController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Informe corretamente o valor da gasolina";
                          } else {
                            if (double.tryParse(value) != null) {
                              if (double.parse(value.toString()) <= 0) {
                                return "O valor precisa ser positivo!";
                              }
                            }
                            return null;
                          }
                        },
                        textAlign: TextAlign.center,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: InputDecoration(
                            labelText: 'Valor da Gasolina',
                            labelStyle: TextStyle(color: Colors.blue[900]),
                            errorStyle: const TextStyle(fontSize: 16)),
                        style: TextStyle(
                            color: Colors.lightBlue[800], fontSize: 26)),
                    Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: SizedBox(
                            height: 50.0,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _calculaCombustivelIdeal();
                                  }
                                },
                                child: const Text("Verificar",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25)),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightBlue[900],
                                )))),
                    Text(
                      _resultado,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.lightBlue[900], fontSize: 26.0),
                    )
                  ]),
            )));
  }
}

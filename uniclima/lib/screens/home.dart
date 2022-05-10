import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:uniclima/model/clima_model.dart';
import 'package:uniclima/widgets/clima_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ClimaModel climaModel;
  bool _isLoading = false;

  final List<String> _cidades = [
    "Aracaju",
    "Belém",
    "Belo Horizonte",
    "Boa Vista",
    "Brasilia",
    "Campo Grande",
    "Cuiaba",
    "Curitiba",
    "Florianópolis",
    "Fortaleza",
    "Goiânia",
    "João Pessoa",
    "Macapá",
    "Maceió",
    "Manaus",
    "Natal",
    "Palmas",
    "Porto Alegre",
    "Porto Velho",
    "Recife",
    "Rio Branco",
    "Rio de Janeiro",
    "Salvador",
    "São Luis",
    "São Paulo",
    "Teresina",
    "Vitória"
  ];

  String _cidadeSelecionada = "São Paulo";

  carregaClima() async {
    setState(() {
      _isLoading = true;
    });

    const String _apiURL = "api.openweathermap.org"; //link da API
    const String _path = "/data/2.5/weather"; //a pasta da API
    const String _appid = "df0473855f9a99514e1f77ade763165d"; //SUA chave de API
    const String _units = "metric";
    const String _lang = "pt_br";

    final _parametros = {
      "q": _cidadeSelecionada,
      "appid": _appid,
      "units": _units,
      "lang": _lang
    };

    final climaResponse =
        await http.get(Uri.https(_apiURL, _path, _parametros));

    //apenas para fins de depuração... não é exibido para o usuário em momento algum
    //print("URL gerada = " + climaResponse.request!.url.toString());

    setState(() {
      if (climaResponse.statusCode == 200) {
        climaModel = ClimaModel.fromJson(jsonDecode(climaResponse.body));
      }
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    carregaClima();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var screenPadding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        title: Text(_cidadeSelecionada),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: _cidades,
              showSearchBox: true,
              maxHeight: height - screenPadding.bottom,
              dropdownSearchDecoration: InputDecoration(
                hintText: _cidadeSelecionada,
                contentPadding: const EdgeInsets.only(left: 20),
              ),
              onChanged: (value) {
                setState(() {
                  _cidadeSelecionada = value!;
                  carregaClima();
                });
              },
              emptyBuilder: (context, searchEntry) => const Center(
                  child: Text('Cidade não encontrada',
                      style: TextStyle(color: Colors.blue))),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                          strokeWidth: 5,
                        )
                      : climaModel != null
                          ? ClimaWidget(climaModel: climaModel)
                          : Text("Sem dados para exibir",
                              style: Theme.of(context).textTheme.headline4),
                ),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: _isLoading
                        ? Text("Carregando...",
                            style: Theme.of(context).textTheme.headline4)
                        : IconButton(
                            icon: const Icon(Icons.refresh),
                            iconSize: 50,
                            color: Colors.blue,
                            tooltip: "Recarregar clima",
                            onPressed: carregaClima,
                          ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}

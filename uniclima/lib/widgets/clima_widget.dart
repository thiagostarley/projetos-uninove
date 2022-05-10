import 'package:flutter/material.dart';
import 'package:uniclima/model/clima_model.dart';

class ClimaWidget extends StatelessWidget {
  final ClimaModel climaModel;

  const ClimaWidget({Key? key, required this.climaModel}) : super(key: key);

  String _primeiraMaiuscula(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "http://openweathermap.org/img/wn/${climaModel.icone}@2x.png",
          fit: BoxFit.cover,
          width: 120,
        ),
        Text(
          "${climaModel.temperatura.toStringAsFixed(0)} ºC",
          style: const TextStyle(fontSize: 50),
        ),
        const SizedBox(height: 20),
        Text(
          _primeiraMaiuscula(climaModel.descricao),
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 5),
        Text(
          "Sensação térmica: ${climaModel.sesacaoTermica.toStringAsFixed(0)} ºC",
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Text(
          "Mínima do momento: ${climaModel.tempMin.toStringAsFixed(0)} ºC",
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Text(
          "Máxima do momento: ${climaModel.tempMax.toStringAsFixed(0)} ºC",
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Text(
          "Umidade relativa do ar: ${climaModel.umidade}%",
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Text(
          "Visibilidade: ${climaModel.visibilidade}Km",
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Text(
          "Pressão atmosférica: ${climaModel.pressao}hPa",
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Text(
          "Direção do vento: ${climaModel.direcaoVento}º",
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Text(
          "Velocidade do vento: ${climaModel.velocidadeVento}m/s",
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

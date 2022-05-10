class ClimaModel {
  final double temperatura;
  final double tempMin;
  final double tempMax;
  final double sesacaoTermica;
  final String descricao;
  final String icone;
  final int umidade;
  final int visibilidade;
  final int pressao;
  final double velocidadeVento;
  final int direcaoVento;

  ClimaModel(
      {required this.temperatura,
      required this.tempMin,
      required this.tempMax,
      required this.sesacaoTermica,
      required this.descricao,
      required this.icone,
      required this.umidade,
      required this.visibilidade,
      required this.pressao,
      required this.direcaoVento,
      required this.velocidadeVento});

  factory ClimaModel.fromJson(Map<String, dynamic> json) {
    return ClimaModel(
        temperatura: json["main"]["temp"],
        tempMin: json["main"]["temp_min"],
        tempMax: json["main"]["temp_max"],
        sesacaoTermica: json["main"]["feels_like"],
        descricao: json["weather"][0]["description"],
        icone: json["weather"][0]["icon"],
        umidade: json["main"]["humidity"],
        visibilidade: json["visibility"],
        pressao: json["main"]["pressure"],
        velocidadeVento: json["wind"]["speed"],
        direcaoVento: json["wind"]["deg"]
      );
  }
}

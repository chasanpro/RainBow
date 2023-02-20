// To parse this JSON data, do
//
//     final nxtWeather = nxtWeatherFromJson(jsonString);

import 'dart:convert';

NxtWeather nxtWeatherFromJson(String str) =>
    NxtWeather.fromJson(json.decode(str));

String nxtWeatherToJson(NxtWeather data) => json.encode(data.toJson());

class NxtWeather {
  NxtWeather({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory NxtWeather.fromJson(Map<String, dynamic> json) => NxtWeather(
        status: json["status"],
        data: Data.fromJson(json["DATA"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "DATA": data.toJson(),
      };
}

class Data {
  Data({
    required this.day1,
    required this.day2,
    required this.day3,
    required this.day4,
    required this.day5,
    required this.day6,
    required this.day7,
    required this.cityId,
  });

  Day day1;
  Day day2;
  Day day3;
  Day day4;
  Day day5;
  Day day6;
  Day day7;
  String cityId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        day1: Day.fromJson(json["day1"]),
        day2: Day.fromJson(json["day2"]),
        day3: Day.fromJson(json["day3"]),
        day4: Day.fromJson(json["day4"]),
        day5: Day.fromJson(json["day5"]),
        day6: Day.fromJson(json["day6"]),
        day7: Day.fromJson(json["day7"]),
        cityId: json["cityId"],
      );

  Map<String, dynamic> toJson() => {
        "day1": day1.toJson(),
        "day2": day2.toJson(),
        "day3": day3.toJson(),
        "day4": day4.toJson(),
        "day5": day5.toJson(),
        "day6": day6.toJson(),
        "day7": day7.toJson(),
        "cityId": cityId,
      };
}

class Day {
  Day({
    required this.temperature,
    required this.condition,
  });

  int temperature;
  String condition;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        temperature: json["temperature"],
        condition: json["condition"],
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "condition": condition,
      };
}

// To parse this JSON data, do
//
//     final cityToJson = cityJson(jsonString);

import 'dart:convert';

CityToJson cityJson(String str) => CityToJson.fromJson(json.decode(str));

String cityToJsonToJson(CityToJson data) => json.encode(data.toJson());

class CityToJson {
  CityToJson({
    required this.msg,
    required this.list,
  });

  String msg;
  List<ListElement> list;

  factory CityToJson.fromJson(Map<String, dynamic> json) => CityToJson(
        msg: json["msg"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    required this.id,
    required this.name,
    required this.state,
    required this.country,
  });

  String id;
  String name;
  String state;
  String country;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        name: json["name"],
        state: json["state"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "state": state,
        "country": country,
      };
}

class timeWeather {
  List<DATA>? dATA;

  timeWeather(String body, {this.dATA});

  timeWeather.fromJson(Map<String, dynamic> json) {
    if (json['DATA'] != null) {
      dATA = <DATA>[];
      json['DATA'].forEach((v) {
        dATA!.add(DATA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dATA != null) {
      data['DATA'] = dATA!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DATA {
  String? sId;
  String? time;
  int? temperature;
  String? condition;
  String? cityId;
  String? createdAt;
  String? updatedAt;

  DATA(
      {this.sId,
      this.time,
      this.temperature,
      this.condition,
      this.cityId,
      this.createdAt,
      this.updatedAt});

  DATA.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    time = json['time'];
    temperature = json['temperature'];
    condition = json['condition'];
    cityId = json['cityId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['time'] = time;
    data['temperature'] = temperature;
    data['condition'] = condition;
    data['cityId'] = cityId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

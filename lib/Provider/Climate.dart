// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClimateProvider with ChangeNotifier {

  var timeWeatherdata, next_WeatherList, cityNameList, liveWeather;
  String homeIconPath = "assets/thunder.png";
  String cityName = "Select Your City";
  String dgx = "°C";
  String token = "";
  String date = "";
  int temperature = 0,
      maxTemperature = 0,
      minTemperature = 0,
      humidity = 0,
      windSpeed = 0;
  String cityId = "", condition = "", email = "";
// ignore: prefer_typing_uninitialized_variables
  late var cityList, nextWeatherList;

  String loginStatus = "none";
  void createUser() {
    loginStatus = "loggedIN";
    notifyListeners();
  }

  Future<int> login(String email, String password) async {
    String url = "https://hiring-test.a2dweb.com/login";
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode({"email": email, "password": password}),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      print(" LOGIN SUCESS");

      Map<String, dynamic> responseJson = json.decode(response.body);
      print(responseJson["liveWeather"]["condition"]);
      token = responseJson["token"];
      cityId = responseJson["liveWeather"]["cityId"];
      date = responseJson["liveWeather"]["date"];
      minTemperature = responseJson["liveWeather"]["minTemperature"];
      maxTemperature = responseJson["liveWeather"]["maxTemperature"];
      temperature = responseJson["liveWeather"]["temperature"];
      humidity = responseJson["liveWeather"]["humidity"];
      windSpeed = responseJson["liveWeather"]["windSpeed"];
      condition = responseJson["liveWeather"]["condition"];
      homeIconSet(condition);
      cityListFetch();
      notifyListeners();
      return 1;
    } else {
      return 0;
    }
  }

  Future<int> create(String email, String password, String name, String country,
      String phone) async {
    String url = "https://hiring-test.a2dweb.com/create-user";
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "country": "USA"
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      print(" CREATE SUCESS 🦋🦋");
      email = email;

      notifyListeners();
      return 1;
    } else {
      return 0;
    }
  }

  void cityListFetch() async {
    Uri url =
        Uri.parse("https://hiring-test.a2dweb.com/city-list?page=1&limit=5");
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode.toString().contains("2")) {
      cityNameList = jsonDecode(response.body)["list"];

      print(cityNameList);
      // cityList = cityJson(response.body);
      notifyListeners();
    } else {}
  }

  void weatherByTime() async {
    Uri url =
        Uri.parse("https://hiring-test.a2dweb.com/view-small-forecast/$cityId");
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode.toString().contains("2")) {
      timeWeatherdata = jsonDecode(response.body)["DATA"];

      notifyListeners();
      nextWeatherReport();
    } else {}
  }

  void nextWeatherReport() async {
    Uri url =
        Uri.parse("https://hiring-test.a2dweb.com/view-other-forecast/$cityId");
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode.toString().contains("2")) {
      next_WeatherList = jsonDecode(response.body)["DATA"];
      print(next_WeatherList["day1"]["temperature"]);
      notifyListeners();
    } else {}
  }

  void setCity(String idOfCity) {
    cityId = idOfCity;


    liveWeatherUpdate(cityId);
  }
  // ignore: non_constant_identifier_names
  void setCityName(String city_Name) {
    cityName = city_Name;
    notifyListeners();
  }

  void liveWeatherUpdate(String cityID) async {
    Uri url = Uri.parse("https://hiring-test.a2dweb.com/live-weather/$cityID");
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode.toString().contains("2")) {
      liveWeather = jsonDecode(response.body)["data"];
      print(liveWeather);
      cityId = liveWeather["cityId"];
      minTemperature = liveWeather["minTemperature"];
      maxTemperature = liveWeather["maxTemperature"];
      temperature = liveWeather["temperature"];
      humidity = liveWeather["humidity"];
      windSpeed = liveWeather["windSpeed"];
      condition = liveWeather["condition"];
      notifyListeners();
    } else {}
  }

  void homeIconSet(String condition) {
    switch (condition) {
      case "Cloudy":
        {
          homeIconPath = "assets/cloudy.png";
          notifyListeners();
        }
        break;
      case "Stormy":
        {
          homeIconPath = "assets/storm.png";
          notifyListeners();
        }
        break;
      case "Snow":
        {
          homeIconPath = "assets/snow.png";
          notifyListeners();
        }
        break;
      case "Sunny":
        {
          homeIconPath = "assets/sunny.png";
          notifyListeners();
        }
        break;
      case "Rainy":
        {
          homeIconPath = "assets/rainy.png";
          notifyListeners();
        }
        break;
      case "Partly Cloudy":
        {
          homeIconPath = "assets/shade.png";
          notifyListeners();
        }
        break;
    }
  }
}

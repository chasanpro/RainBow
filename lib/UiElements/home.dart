import 'package:climate/Provider/Climate.dart';
import 'package:climate/UiElements/citySelect.dart';
import 'package:climate/UiElements/logout.dart';
import 'package:climate/UiElements/report.dart';
import 'package:climate/etc/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var newFormat = DateFormat.yMMMMd('en_US');
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SafeArea(
                  child: Spacebox(20, 0),
                ),
                Row(
                  children: [
                    Spacebox(0, 20),
                    const Icon(Icons.location_on_outlined,
                        size: 30, color: Colors.white),
                    Spacebox(0, 10),
                    Text(
                      context.read<ClimateProvider>().cityName,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Spacebox(0, 20),
                    const citySelect(),
                    const Spacer(),
                    const logout(),
                    Spacebox(0, 20),
                  ],
                ),
                Spacebox(15, 0),
                Container(
                  height: 130.0,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(context
                              .watch<ClimateProvider>()
                              .homeIconPath
                              .toLowerCase()),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: 500,
                  width: 360,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                        )
                      ],
                      color: Colors.blue,
                      border: Border.all(
                          color: Colors.white.withOpacity(0.9), width: 1.0),
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.3),
                          const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.3)
                        ],
                        stops: const [0.0, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        " Today, ${dateParser(
                          context.watch<ClimateProvider>().date,
                        )}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        "${context.watch<ClimateProvider>().temperature}°C",
                        style: const TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 15.0, // shadow blur
                              color: Color.fromARGB(
                                  255, 130, 123, 123), // shadow color
                              offset: Offset(
                                  -4, 8), // how much shadow will be shown
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Cloudy",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Row(
                        children: [
                          airIcon(),
                          labelColumn(),
                          valueColumn(
                            "6:00 AM",
                            "${context.watch<ClimateProvider>().temperature}°C",
                            "${context.watch<ClimateProvider>().maxTemperature}°C",
                            "${context.watch<ClimateProvider>().minTemperature}°C",
                            context
                                .watch<ClimateProvider>()
                                .condition
                                .toString(),
                            "${context.watch<ClimateProvider>().windSpeed}Km/h",
                            "${context.watch<ClimateProvider>().humidity}%",
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Spacebox(40, 0),
                InkWell(
                  onTap: () {
                    context.read<ClimateProvider>().weatherByTime();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const report()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.75),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16)),
                    height: 55,
                    width: 200,
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "     Forecast  Report",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 20,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer()
              ],
            )));
  }
}

climateRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          value,
          textAlign: TextAlign.end,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    ),
  );
}

airIcon() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      air(),
      air(),
      air(),
      air(),
      air(),
      air(),
      air(),
    ],
  );
}

air() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 3, 30, 3),
    child: Container(
      height: 35.0,
      width: 30,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/air.png"), fit: BoxFit.cover)),
    ),
  );
}

labelColumn() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          "Time",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          "Temperature",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          "Max Temperature",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          "Min Temperature",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          "Condition",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          "Wind Speed",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 10, 11),
        child: Text(
          "Humidity",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    ],
  );
}

valueColumn(String time, temp, maxTemp, minTemp, condition, wind, humidity) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          time,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          temp,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          maxTemp,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          minTemp,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          condition,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          wind,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 10, 11),
        child: Text(
          humidity,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    ],
  );
}

String dateParser(String currentDate) {
  var format = DateFormat('dd/MM/yyyy');
  DateTime date = format.parse(currentDate);
  var newFormat = DateFormat('d MMMM');
  return newFormat.format(date);
}

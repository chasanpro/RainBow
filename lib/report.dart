import 'package:climate/weatherIcon.dart';
import 'package:climate/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Climate.dart';
import 'NextReport.dart';
import 'dateParser.dart';

class report extends StatefulWidget {
  const report({super.key});

  @override
  State<report> createState() => _reportState();
}

class _reportState extends State<report> {
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
            Spacebox(10, 0),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  Spacebox(0, 15),
                  const Icon(
                    Icons.keyboard_arrow_left,
                    size: 35,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Back",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  Spacebox(0, 20),
                  const Text(
                    "Today",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Text(
                    " ${monthParser(
                      context.watch<ClimateProvider>().date,
                    )}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacebox(0, 20),
                ],
              ),
            ),
            SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      context.watch<ClimateProvider>().timeWeatherdata.length,
                  itemBuilder: (context, index) {
                    if (index == 2) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.9),
                                width: 1.0),
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.3),
                                const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.3)
                              ],
                              stops: const [0.0, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          height: 50,
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                " ${context.watch<ClimateProvider>().timeWeatherdata[index]["temperature"]}°C",
                                style: const TextStyle(
                                    color: Colors.white,
                                    // fontSize: 25,
                                    fontWeight: FontWeight.w400),
                              ),
                              Image.asset(weatherIcon_by_Condition(context
                                  .watch<ClimateProvider>()
                                  .timeWeatherdata[index]["condition"])),
                              Text(
                                " ${context.watch<ClimateProvider>().timeWeatherdata[index]["time"]}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    // fontSize: 25,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 50,
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                " ${context.watch<ClimateProvider>().timeWeatherdata[index]["temperature"]}°C",
                                style: const TextStyle(
                                    color: Colors.white,
                                    // fontSize: 25,
                                    fontWeight: FontWeight.w400),
                              ),
                              Image.asset(weatherIcon_by_Condition(context
                                  .watch<ClimateProvider>()
                                  .timeWeatherdata[index]["condition"])),
                              Text(
                                " ${context.watch<ClimateProvider>().timeWeatherdata[index]["time"]}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    // fontSize: 25,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                )),
            const nextReport()
          ],
        ),
      ),
    );
  }
}

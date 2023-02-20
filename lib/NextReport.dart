import 'package:climate/Climate.dart';

import 'package:climate/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dateParser.dart';
import 'weatherIcon.dart';

class nextReport extends StatelessWidget {
  const nextReport({super.key});

  @override
  Widget build(BuildContext context) {
    // context.watch<ClimateProvider>().nextWeatherList;
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Spacebox(MediaQuery.of(context).size.height / 50, 0),
          Row(
            children: [
              Spacebox(0, 20),
              const Text(
                "NEXT REPORT",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              const Icon(Icons.calendar_today_outlined,
                  size: 30, color: Colors.white),
              Spacebox(0, 20),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.9,
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          addDay(
                              context.watch<ClimateProvider>().date, index + 1),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacebox(0, 1),
                        SizedBox(
                          height: 50,
                          width: 70,
                          child: Image.asset(
                            weatherIcon_by_Condition(context
                                    .read<ClimateProvider>()
                                    .next_WeatherList["day" "${1 + index}"]
                                ["condition"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Spacebox(0, 1),
                        Text(
                          "${context.read<ClimateProvider>().next_WeatherList["day" "${1 + index}"]["temperature"]} °C",
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        // Spacebox(0, 1),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

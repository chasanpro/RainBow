import 'dart:ui';

import 'package:climate/Provider/Climate.dart';
import 'package:climate/etc/textField.dart';
import 'package:climate/etc/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class citySelect extends StatelessWidget {
  const citySelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: InkWell(
          onTap: () {
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ));

            showDialog(
                barrierColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: Align(
                      alignment: const Alignment(0, -.65),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height * .5,
                        width: MediaQuery.of(context).size.width * .9,
                        child: Column(
                          children: [
                            Spacebox(10, 0),
                            Material(
                              color: Colors.transparent,
                              child: reusableTf(
                                  onChanged: (value) {},
                                  hintText: "Search here",
                                  obscureText: false,
                                  textInputType: TextInputType.name,
                                  label: ""),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .4,
                              width: MediaQuery.of(context).size.width * .8,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Material(
                                      child: InkWell(
                                        onTap: () {
                                          Provider.of<ClimateProvider>(context,
                                                  listen: false)
                                              .setCity(context
                                                  .read<ClimateProvider>()
                                                  .cityNameList[index]["_id"]);
                                          Provider.of<ClimateProvider>(context,
                                                  listen: false)
                                              .setCityName(context
                                                      .read<ClimateProvider>()
                                                      .cityNameList[index]
                                                  ["state"]);
                                          Navigator.pop(context);

                                          // context
                                          //     .watch<ClimateProvider>()
                                          //     .setCity(context
                                          //         .read<ClimateProvider>()
                                          //         .cityNameList[index]["_id"]);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                color: Color.fromARGB(
                                                    255, 37, 37, 37),
                                              ),
                                              Spacebox(0, 5),
                                              climateTxt(
                                                  context
                                                          .read<ClimateProvider>()
                                                          .cityNameList[index]
                                                      ["state"],
                                                  15,
                                                  Colors.black),
                                              const Spacer(),
                                              climateTxt(
                                                  "8°C/24°C", 15, Colors.black)
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          child: const Icon(Icons.expand_more, size: 20, color: Colors.white),
        ),
      ),
    );
  }
}

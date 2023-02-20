import 'dart:io';

import 'package:climate/widgets.dart';
import 'package:flutter/material.dart';

class logout extends StatelessWidget {
  const logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * .45,
                      width: MediaQuery.of(context).size.width * .8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            child: Container(
                              height: MediaQuery.of(context).size.height * .2,
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.red[100],
                              ),
                              child: const Icon(
                                Icons.power_settings_new,
                                size: 55,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          climateTxt("Logout", 20, Colors.black),
                          climateTxt("Are out sure you want to Logout from app",
                              15, const Color.fromARGB(255, 24, 23, 23)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Material(
                                child: InkWell(
                                  onTap: () {
                                    exit(0);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                            255, 253, 101, 101),
                                      ),
                                      height: 50,
                                      width: 120,
                                      child: Center(
                                          child: climateTxt(
                                              "Logout", 20, Colors.white))),
                                ),
                              ),
                              Material(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                            255, 227, 217, 217),
                                      ),
                                      height: 50,
                                      width: 120,
                                      child: Center(
                                          child: climateTxt(
                                              "Cancel", 20, Colors.black))),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: const Icon(
            Icons.power_settings_new,
            size: 25,
            color: Colors.pinkAccent,
          ),
        ),
      ),
    );
  }
}

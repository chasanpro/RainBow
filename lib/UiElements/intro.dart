import 'package:climate/UiElements/login.dart';
import 'package:climate/UiElements/signUp.dart';
import 'package:climate/etc/widgets.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class intro extends StatelessWidget {
  const intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/intro.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: 361,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: bg_color),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacebox(10, 0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 30, 29, 20),
                    child: EasyRichText(
                      "Explore global map of Wind,      Weather and Ocean conditions",
                      textAlign: TextAlign.left,
                      defaultStyle: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 21),
                      patternList: const [],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 29, 40),
                    child: EasyRichText(
                      "Planning your trip become more easier with ideal weather app. you can instantly see the world weather within few second",
                      textAlign: TextAlign.left,
                      defaultStyle: const TextStyle(
                          fontWeight: FontWeight.w200, fontSize: 15),
                      patternList: const [],
                    ),
                  ),
                  Spacebox(30, 0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const signUp()),
                      );
                    },
                    child: waterButton("Get Started"),
                  ),
                  Spacebox(5, 0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 29, 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const logIn()),
                        );
                      },
                      child: EasyRichText(
                        "Already have an account ? Log in",
                        textAlign: TextAlign.left,
                        defaultStyle: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 15),
                        patternList: [
                          EasyRichTextPattern(
                            targetString: 'Log in',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacebox(40.0, 10.0)
          ],
        ) /* add child content here */,
      ),
    );
  }
}

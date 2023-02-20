import 'package:flutter/material.dart';

import 'login.dart';
import 'widgets.dart';

class userCreated extends StatelessWidget {
  const userCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 180,
              height: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo.png"),
                  fit: BoxFit.contain,
                ),
              )),
          Spacebox(5, 0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 120,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/smile.png"),
                      fit: BoxFit.contain,
                    ),
                  )),
              const Text(
                "Congratulations",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              ),
              Spacebox(20, 0),
              const Text(
                "Your Account Created",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Spacebox(5, 0),
              const Text(
                "Succesfully",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
          Spacebox(180, 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.keyboard_arrow_left,
                size: 25,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              Spacebox(0, 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const logIn()),
                  );
                },
                child: const Text(
                  "Back to Login",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

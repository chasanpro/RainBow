import 'package:climate/Climate.dart';
import 'package:climate/home.dart';
import 'package:climate/textField.dart';
import 'package:climate/widgets.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  bool value = false;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 327,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/login_logo.png"),
                  fit: BoxFit.contain,
                ),
              )),
          reusableTf(
            hintText: "Email",
            obscureText: false,
            label: "",
            onChanged: (value) {
              email = value;
            },
            textInputType: TextInputType.emailAddress,
          ),
          reusableTf(
            hintText: "Password",
            obscureText: false,
            label: "",
            onChanged: (value) {
              password = value;
            },
            textInputType: TextInputType.name,
          ),
          Row(
            children: [
              Spacebox(0, 30),
              Checkbox(
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = !this.value;
                    });
                  }),
              const Text("Remember me ")
            ],
          ),
          InkWell(
            onTap: () {
              print(email);
              print(password);
              context.read<ClimateProvider>().login(email, password);
              // context.read<ClimateProvider>().cityList;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const homeScreen()));
            },
            child: waterButton("Login"),
          ),
          Spacebox(MediaQuery.of(context).size.height / 3, 0),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 29, 40),
            child: EasyRichText(
              "Don't have an account ? Signup",
              textAlign: TextAlign.left,
              defaultStyle:
                  const TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
              patternList: [
                EasyRichTextPattern(
                  targetString: 'Signup',
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

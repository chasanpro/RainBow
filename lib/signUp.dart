import 'package:climate/Climate.dart';
import 'package:climate/login.dart';
import 'package:climate/textField.dart';
import 'package:climate/userCreated.dart';
import 'package:climate/widgets.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  List<String> list = <String>['USA'];
  String? name, email, password, phone;

  @override
  Widget build(BuildContext context) {
    var dropdownValue = list.first;
    final iskeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Material(
      color: Colors.white,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: true,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!iskeyboard)
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
                  hintText: "Full Name",
                  obscureText: false,
                  label: "",
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  textInputType: TextInputType.name,
                ),
                Spacebox(20, 10),
                reusableTf(
                  hintText: "Phone Number",
                  obscureText: false,
                  label: "",
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                  textInputType: TextInputType.phone,
                ),
                Spacebox(30, 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)),
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.width * .12,
                  child: Row(
                    children: [
                      Spacebox(0, 20),
                      const Text("USA"),
                      const Spacer(),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          // color: Colors.grey,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Spacebox(10, 10),
                reusableTf(
                  hintText: "Email",
                  obscureText: false,
                  label: "",
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  textInputType: TextInputType.emailAddress,
                ),
                Spacebox(10, 10),
                reusableTf(
                  hintText: "Password",
                  obscureText: true,
                  label: "",
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  textInputType: TextInputType.name,
                ),
                Spacebox(20, 0),
                InkWell(
                  onTap: () {
                    print("🐤");
                    print("email :$password");
                    // ignore: unrelated_type_equality_checks
                    context
                        .read<ClimateProvider>()
                        .create(email!, password!, name!, "USA", phone!);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const userCreated()),
                    );
                  },
                  child: waterButton("Signup"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 29, 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const logIn()),
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
        ),
      ),
    );
  }
}

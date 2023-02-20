import 'package:flutter/material.dart';

class reusableTf extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final String label;

  final Function(String)? onChanged;

  final TextInputType textInputType;

  const reusableTf(
      {super.key,
      required this.onChanged,
      required this.hintText,
      required this.obscureText,
      required this.textInputType,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .09,
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey)),
          width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.width * .12,
          child: Center(
            child: TextField(
              obscureText: obscureText,
              onChanged: onChanged,
              keyboardType: textInputType,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),

                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(0, 158, 158, 158), width: 1.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: const OutlineInputBorder(

                    // borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),

                // ignore: unnecessary_null_comparison
              ),
            ),
          ),
        ),
      ],
    );
  }
}

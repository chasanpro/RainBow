import 'package:flutter/material.dart';

Spacebox(double h, double w) {
  return SizedBox(
    height: h.toDouble() ?? 1.0,
    width: w.toDouble() ?? 0.0,
  );
}

Color bg_color = const Color.fromRGBO(231, 231, 231, 1);

greyButton(String label) {
  return Container(
    height: 60,
    width: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: const LinearGradient(
          colors: [
            Colors.grey,
            Color.fromRGBO(160, 163, 167, 1),
            //add more colors for gradient
          ],
          begin: Alignment.topCenter, //begin of the gradient color
          end: Alignment.bottomCenter, //end of the gradient color
          stops: [0, 0.8] //stops for individual color
          //set the stops number equal to numbers of color
          ),
    ),
    child: Center(
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    ),
  );
}
waterButton(String label) {
  return Container(
    height: 60,
    width: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(71, 191, 223, 1),
            Color.fromRGBO(74, 145, 255, 1),
            //add more colors for gradient
          ],
          begin: Alignment.topCenter, //begin of the gradient color
          end: Alignment.bottomCenter, //end of the gradient color
          stops: [0, 0.8] //stops for individual color
          //set the stops number equal to numbers of color
          ),
    ),
    child: Center(
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    ),
  );
}

climateTxt(String label, double size, Color paint) {
  return Material(
    color: Colors.transparent,
    child: Text(
      label,
      style: TextStyle(color: paint, fontSize: size),
    ),
  );
}

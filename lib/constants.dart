import 'package:flutter/material.dart';

const Color orangePrimary = Color(0xffDD7F5A);
const Color orangeSecondary = Color(0xffF0A963);
const Color bluePrimary = Color(0xff61A1D7);
const Color blueSecondary = Color(0xffA1C5E7);
const Color background = Color(0xffF2EBE2);
const Color idcText = Color(0xff999999);

Function()? goToHomePage(BuildContext context) {
  return () {
    Navigator.pushNamed(context, '/homePage');
  };
}

Function()? goToStreamPage(BuildContext context) {
  return () {
    Navigator.pushNamed(context, '/streamPage');
  };
}

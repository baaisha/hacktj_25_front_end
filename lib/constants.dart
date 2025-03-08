import 'package:flutter/material.dart';

const Color orangePrimary = Color(0xffDD7F5A);
const Color orangeSecondary = Color(0xffF0A963);
const Color bluePrimary = Color(0xff61A1D7);
const Color blueSecondary = Color(0xffA1C5E7);
const Color background = Color(0xffFEFDF8);

Function()? goToHomePage(BuildContext context){
    return (){Navigator.pushNamed(context, '/homePage');};
}
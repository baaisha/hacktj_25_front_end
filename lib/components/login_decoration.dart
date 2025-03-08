import 'package:flutter/material.dart';
import 'package:hacktj_25_front_end/constants.dart';

class LoginDecoration extends StatelessWidget {
  const LoginDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CurvedClipper(),
          child: Container(
            height: 400,
            width: double.infinity,
            color: Color(0xffDD7F5A),
          ),
        ),
        ClipPath(
          clipper: CurvedClipper(),
          child: Container(
            height: 375,
            width: double.infinity,
            color: Color(0xffF0A963),
          ),
        ),
        ClipPath(
          clipper: CurvedClipper(),
          child: Container(
            height: 350,
            width: double.infinity,
            color: Color(0xffA1C5E7),
          ),
        ),
        ClipPath(
          clipper: CurvedClipper(),
          child: Container(
              height: 325,
              width: double.infinity,
              color: Color(0xff61A1D7),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                          color: background,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Login to your account?",
                      style: TextStyle(color: background, fontSize: 15),
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Start from bottom left
    path.quadraticBezierTo(
      size.width / 2, size.height, // Control point
      size.width, size.height - 50, // End point
    );
    path.lineTo(size.width, 0); // Top right
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/material.dart';
import 'package:hacktj_25_front_end/components/login_components/login_button.dart';
import 'package:hacktj_25_front_end/components/login_components/login_decoration.dart';
import 'package:hacktj_25_front_end/components/login_components/password_field.dart';
import 'package:hacktj_25_front_end/components/login_components/username_field.dart';
import 'package:hacktj_25_front_end/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          LoginDecoration(),
          SizedBox(height: 20),
          UsernameField(),
          PasswordField(),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password?",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: orangePrimary,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          LoginButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dont have an account?",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: idcText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: InkWell(
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: orangePrimary,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: orangePrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

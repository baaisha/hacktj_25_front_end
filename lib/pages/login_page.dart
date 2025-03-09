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
    // FocusNodes for controlling focus behavior
    final FocusNode usernameFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // This will resize the body when the keyboard is open
      backgroundColor: background,
      body: SingleChildScrollView(
        // Make the content scrollable
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              LoginDecoration(),
              SizedBox(height: 20),
              UsernameField(), // Username with focus node
              PasswordField(), // Password with focus node
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
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
              SizedBox(height: 30),
              LoginButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
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
        ),
      ),
    );
  }
}

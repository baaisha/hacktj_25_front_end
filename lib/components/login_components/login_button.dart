import 'package:flutter/material.dart';
import 'package:hacktj_25_front_end/constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, bottom: 5, top: 15),
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: orangePrimary),
        child: TextButton(
          onPressed: goToStreamPage(context),
          style: ButtonStyle(backgroundColor: WidgetStateColor.transparent),
          child: Text(
            "Login",
            style: TextStyle(
                color: background, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

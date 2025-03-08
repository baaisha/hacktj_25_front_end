import 'package:flutter/material.dart';
import 'package:hacktj_25_front_end/constants.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = false;

  void onVisiblePressed() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5, top: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0x66A1C5E7)),
        child: TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          autocorrect: false,
          obscureText: !isVisible,
          cursorColor: bluePrimary,
          style: TextStyle(overflow: TextOverflow.visible),
          decoration: InputDecoration(
            focusColor: bluePrimary,
            border: InputBorder.none,
            hintText: "Password",
            hintStyle:
                TextStyle(color: bluePrimary, fontWeight: FontWeight.w600),
            prefixIcon: Icon(
              Icons.lock,
              color: bluePrimary,
            ),
            suffixIconColor: bluePrimary,
            suffixIcon: IconButton(
                onPressed: onVisiblePressed,
                icon: isVisible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off)),
            contentPadding: EdgeInsets.all(15),
          ),
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}

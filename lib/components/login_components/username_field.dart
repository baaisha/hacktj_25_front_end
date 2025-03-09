import 'package:flutter/material.dart';
import 'package:hacktj_25_front_end/constants.dart';

class UsernameField extends StatefulWidget {
  const UsernameField({super.key});

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5, top: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0x66F0A963)),
        child: TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          autocorrect: false,
          cursorColor: orangePrimary,
          style: TextStyle(overflow: TextOverflow.visible),
          decoration: InputDecoration(
            focusColor: orangePrimary,
            border: InputBorder.none,
            hintText: "Username",
            hintStyle:
                TextStyle(color: orangePrimary, fontWeight: FontWeight.w600),
            prefixIcon: Icon(
              Icons.person,
              color: orangePrimary,
            ),
            contentPadding: EdgeInsets.all(15),
          ),
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}

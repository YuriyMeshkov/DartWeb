import 'package:alim_freight_app/constants.dart';
import 'package:flutter/material.dart';


class LoginPasswordField extends StatefulWidget {
  final TextEditingController controller;

  LoginPasswordField(this.controller);

  @override
  _LoginPasswordFieldState createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool obscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscured,
      maxLength: 20,
      maxLines: 1,
      autovalidate: true,
      validator: (value) {
        bool validateStructure(String value) {
          String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
          RegExp regExp = RegExp(pattern);
          return regExp.hasMatch(value);
        }

        if (validateStructure(value)) {
          return null;
        } else {
          return 'Min 6 characters, at least one letter and one number!';
        }
      },
      enableInteractiveSelection: true,
      decoration: kTextFieldDecorationLogin.copyWith(
        hintText: 'Password',
        helperText: 'Enter your password here',
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock_open),
        suffixIcon: IconButton(
          icon: Icon(obscured ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() => obscured = !obscured);
          },
        ),
      ),
    );
  }
}

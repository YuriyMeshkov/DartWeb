import 'package:alim_freight_app/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';



class LoginEmailField extends StatelessWidget {
  final TextEditingController controller;

  LoginEmailField(this.controller);


  @override
  Widget build(BuildContext context) {
    final  controller = TextEditingController();

    return TextFormField(
      controller: controller,
      autovalidate: true,
      validator: (value) {
        if (EmailValidator.validate(value)) {
          return null;
        } else {
          return 'Please enter a valid Email address';
        }
      },
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      enableInteractiveSelection: true,
      decoration: kTextFieldDecorationReg.copyWith(
        prefixIcon: Icon(Icons.mail_outline),
          hintText: 'user@domain.com',
          helperText: 'Enter your Email address here',
          labelText: 'Email address'
      ),
    );
  }
}

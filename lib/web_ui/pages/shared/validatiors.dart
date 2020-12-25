import 'dart:async';
import 'package:email_validator/email_validator.dart';


mixin Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      bool validEmail = EmailValidator.validate(email);
      if (validEmail) {
        sink.add(email);
      } else {
        sink.addError('Please enter a valid Email address');
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      bool strength = validateStructure(password);
      if (strength) {
        sink.add(password);
      } else {
        sink.addError(
            "Min 6 characters, at least one letter and one number!");
      }
    },
  );
  static bool validateStructure(String value){
    String  pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }


}



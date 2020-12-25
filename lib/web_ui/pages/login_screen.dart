import 'package:alim_freight_app/constants.dart';
import 'package:alim_freight_app/web_ui/pages/shared/login_email_field.dart';
import 'package:alim_freight_app/web_ui/pages/shared/login_password_field.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  static const String id = '/loginscreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 160.0,
                  child: Image.asset('images/logo.png'),
                ),
                SizedBox(height: 100.0),
                LoginEmailField(_emailController),
                SizedBox(height: 8.0),
                LoginPasswordField(_passwordController),
                SizedBox(height: 5.0),
                //submitButton(),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forgot your"),
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        //Navigator.of(context).pushNamed(ResetPassword.id);
                      },
                      child: Text(
                        "Password ?",
                        style: TextStyle(
                            color: colorSingBlue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 140.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(
                      width: 8.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        //Navigator.of(context).pushNamed(SingUpScreen.id);
                      },
                      child: Text(
                        'Create an Account Now',
                        style: TextStyle(
                            color: colorSingOrange,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

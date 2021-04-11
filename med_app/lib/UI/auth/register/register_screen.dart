import 'package:flutter/material.dart';
import 'package:med_app/UI//auth/register/register_button.dart';
import 'package:med_app/UI/auth/login/Login.dart';
import 'package:med_app/UI/auth/signup/Signup.dart';

class ResgisterScreen extends StatelessWidget {
  const ResgisterScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage('assets/Logo.png'), height: 450, width: 250),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    // ignore: deprecated_member_use
                    child: ResgisterButtonWidget(
                      buttonInnerText: 'Login',
                      buttonBG: false,
                      buttonNavigation: Login(),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    // ignore: deprecated_member_use
                    child: ResgisterButtonWidget(
                      buttonInnerText: 'Register',
                      buttonBG: true,
                      buttonNavigation: SignUp(),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
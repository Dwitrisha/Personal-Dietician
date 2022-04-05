import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  static const _colorDefault = Color(0xFF21e6c1);
  static const _colorFields = Color(0xFF393e46);
  static const _colorBackground = Color(0xFF222831);
  static const _colorLight = Color(0xFFe4f9ff);
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _colorBackground,
        appBar: AppBar(
          title: Text('Personalized Fitness'),
          centerTitle: true,
          backgroundColor: _colorFields,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: MaterialButton(
                    color: _colorDefault,
                    child: Text('Login'),
                    height: 40.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login_screen');
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: MaterialButton(
                      color: _colorDefault,
                      child: Text('Register'),
                      height: 40.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      onPressed: () {
                        Navigator.pushNamed(context, 'registration_screen');
                      }),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: MaterialButton(
                      color: _colorDefault,
                      child: Text('BMI'),
                      height: 40.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      onPressed: () {
                        Navigator.pushNamed(context, 'bmi');
                      }),
                )
              ]),
        ));
  }
}

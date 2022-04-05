import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  static const _colorDefault = Color(0xFF21e6c1);
  static const _colorFields = Color(0xFF393e46);
  static const _colorBackground = Color(0xFF222831);
  static const _colorLight = Color(0xFFe4f9ff);
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _colorBackground,
        body: Center(
          //CircleAvatar

          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CircleAvatar(
                  radius: 100.0,
                  child: ClipRRect(
                    child: Image.network(
                        "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png"),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  //Text
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: MaterialButton(
                    color: _colorDefault,
                    child: Text('Find a Recipe'),
                    height: 60.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      Navigator.pushNamed(context, 'recipe');
                    },
                  ),
                ),
              ]),
        ));
  }
}

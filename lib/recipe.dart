import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:favorite_button/favorite_button.dart';

User loggedinUser = loggedinUser;

class RecipeScreen extends StatelessWidget {
  static const _colorDefault = Color(0xFF21e6c1);
  static const _colorFields = Color(0xFF393e46);
  static const _colorBackground = Color(0xFF222831);
  static const _colorLight = Color(0xFFe4f9ff);

  static String myVideoId = 'u-pFzXxP4E0';
  // Initiate the Youtube player controller
  //URL: https://youtu.be/u-pFzXxP4E0
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: true,
        loop: false,
        enableCaption: false),
  );

  RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _colorBackground,
        appBar: AppBar(
          title: Text('Recipe'),
          centerTitle: true,
          backgroundColor: _colorFields,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: 'Recipe Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: _colorDefault,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: FavoriteButton(
                      valueChanged: (_) {},
                    ),
                  ),
                  Container(
                    height: 400.0,
                    width: 10.0,
                    child: YoutubePlayer(
                      controller: _controller,
                      liveUIColor: _colorBackground,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: 'Ingredients:  ',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: _colorDefault,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Salt, Pepper',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}

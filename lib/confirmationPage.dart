// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:electrochat/loginscreen.dart';
import 'package:electrochat/welcomescreen.dart';
import 'package:electrochat/component/botton.dart';
import 'package:electrochat/chatscreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ConfirmationPage extends StatelessWidget {
  static const String id = 'confirmationpage';
 // Duration speed = const Duration(milliseconds: 100);
  static const colorizeColors = [
    Colors.blueAccent,
    Colors.blue,
    Colors.greenAccent,
    Colors.deepPurple,
  ];
  static const colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 21, 34, 30),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Image.asset('images/logo1.png')),
          Expanded(
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(

                  'congratulations',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                  speed: Duration(milliseconds: 70),
                ),
                ColorizeAnimatedText(
                  'for registering',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                  speed: Duration(milliseconds: 70),
                ),
                ColorizeAnimatedText(
                  'with us',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                  speed: Duration(milliseconds: 70),
                ),
                ColorizeAnimatedText(
                  'ELECTROCHAT',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                  speed: Duration(milliseconds: 70),
                ),
              ],
              isRepeatingAnimation:false,
              onTap: () {
                Navigator.pushNamed(context, WelcomeScreen.id);
              },
            ),
          ),
          Expanded(
            child: Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
              ),
              color: Colors.blueAccent.shade700,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 80),
                child: Expanded(
                  child: Text(
                    'Congratulations,you are now a registered user!!!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Botton(
                    colour: Colors.lightBlue,
                    title: 'Home',
                    onPressed: () {
                      Navigator.pushNamed(context, WelcomeScreen.id);
                    }),
                Botton(
                    colour: Colors.lightBlue,
                    title: 'chat',
                    onPressed: () {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

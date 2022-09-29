// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:electrochat/component/botton.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:electrochat/registrationscreen.dart';
import 'package:electrochat/loginscreen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcomescreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
      //upperBound: 1.0,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Color.fromRGBO(20, 21, 34, 30),)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
     // print(animation.value);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment.,

              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                      child: Image.asset('images/logo1.png',), height: 60),
                ),
               Expanded(child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Electrochat',textStyle:TextStyle(color:Colors.blueAccent,fontSize: 70,fontWeight: FontWeight.w700),),
                    WavyAnimatedText('Chat with lovers',textStyle:TextStyle(color:Colors.white,fontSize: 50,fontWeight: FontWeight.w700),speed: Duration(microseconds: 100)),
                    WavyAnimatedText('Connect and chill',textStyle:TextStyle(color:Colors.white,fontSize: 40,fontWeight: FontWeight.w700),speed: Duration(microseconds: 100)),
                    WavyAnimatedText('Electrochat',textStyle:TextStyle(color:Colors.blueAccent,fontSize: 70,fontWeight: FontWeight.w700) ,),
                  ],
                  isRepeatingAnimation: false,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
               ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Botton(
                title: 'login',
                colour: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context,LoginScreen.id);
                }),
            Botton(
                title: 'register',
                colour: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),


          ],


        ),

      ),

    );
  }
}

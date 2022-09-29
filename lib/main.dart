// ignore_for_file: prefer_const_constructors

//import 'package:electrochat/workspace.dart';
import 'package:flutter/material.dart';
import 'package:electrochat/welcomescreen.dart';
import 'package:electrochat/loginscreen.dart';
import 'package:electrochat/registrationscreen.dart';
import 'package:electrochat/chatscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:electrochat/confirmationPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( Electrochat());
}


class Electrochat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      // home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
       // GalleryPage.id: (context) => GalleryPage(),
       ConfirmationPage .id: (context) => ConfirmationPage(),
      },
    );
  }
}

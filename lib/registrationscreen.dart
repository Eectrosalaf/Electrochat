// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, unnecessary_null_comparison, use_build_context_synchronously

import 'package:electrochat/chatscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:electrochat/component/botton.dart';
import 'package:electrochat/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:electrochat/confirmationPage.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registrationscreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  String? email;
  String? password;
  //String? login;

  @override
  Widget build(BuildContext context) {
   final String ? eror='';
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 21, 34, 30),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 200.0,
              child: Image.asset('images/logo1.png'),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
                cursorColor: Colors.brown,
                onChanged: (value) {
                  email = value;
                },
                decoration: ktextfieldDeco.copyWith(
                    hintText: 'enter your email',
                    hintStyle: TextStyle(color: Colors.blueAccent))),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
                onChanged: (value) {
                  password = value;
                },
                decoration: ktextfieldDeco.copyWith(
                    hintText: 'enter your password',
                    hintStyle: TextStyle(color: Colors.blueAccent))),
            SizedBox(
              height: 24.0,
            ),
            Botton(
                colour: Colors.lightBlue,
                title: 'register',
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email!, password: password!);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ConfirmationPage.id);
                    }
                  } catch (e) {
                   // print(e);

                    final String  eror ='$e';
                    print('The error is $e');

                   // String eror = 'details is not correct';
                  }
                }),
            // Container(
            //   height: 40,
            //   color: Colors.blueAccent,
            //   child: Text(
            //     'the error is $eror',
            //     style: TextStyle(color: Colors.white),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

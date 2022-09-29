// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_build_context_synchronously, unnecessary_null_comparison

import 'package:electrochat/constant.dart';
import 'package:flutter/material.dart';
import 'package:electrochat/component/botton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chatscreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'loginscreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  String ? email;
  String ? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color.fromRGBO(20, 21, 34, 30),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                     Hero(
                      tag: 'logo1',
                      child: Container(
                        height: 200.0,
                        child: Expanded(child: Image.asset('images/logo1.png')),
                      ),


                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color:Colors.blueAccent,
                      ),
                      cursorColor: Colors.brown,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration:
                          ktextfieldDeco.copyWith(hintText: 'Enter your mail',hintStyle:TextStyle(color:Colors.blueAccent) )),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      cursorColor: Colors.cyan,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration:
                          ktextfieldDeco.copyWith(hintText: 'Enter password',hintStyle:TextStyle(color:Colors.blueAccent) )),
                  SizedBox(
                    height: 24.0,
                  ),
                  Botton(
                      colour: Colors.lightBlue,
                      title: 'log in',
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });

                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email!, password: password!);
                          if (user != null) {
                            Navigator.pushNamed(context, ChatScreen.id);
                          }

                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      })
                ],
              ),
          ),
        ),

    );
  }
}

// ignore_for_file: empty_catches, prefer_const_constructors, deprecated_member_use, library_private_types_in_public_api, must_be_immutable, use_key_in_widget_constructors, non_constant_identifier_names, unrelated_type_equality_checks, avoid_print, prefer_const_constructors_in_immutables, depend_on_referenced_packages

// ignore_for_file: empty_statements

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:electrochat/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

final _firestore = FirebaseFirestore.instance;
String? loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chatscreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();

  String? MessageText;

  @override
  void initState() {
    super.initState();
    getcurrentUser();
  }

  void getcurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user.email;
        print(loggedInUser);
      }
    } catch (e) {}
    ;
  }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 21, 34, 30),
      appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _auth.signOut();
                   Navigator.pop(context);
                }),
          ],
          title: Text('ElectroChat'),
          backgroundColor:Color.fromRGBO(20, 21, 34, 30),),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(

                      controller: messageTextController,
                      style: TextStyle(color: Colors.blueAccent),
                      onChanged: (value) {
                        MessageText = value;

                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text': MessageText,
                        'sender': loggedInUser,
                      });
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot?>(
        // initialData: '',
        stream: _firestore.collection("messages")
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshot.data?.docs.reversed;

          List<MessageBubble> messageBubbles = [];
          for (var message in messages!) {
            String? messageText = message.get('text');
            String? messageSender = message.get('sender');
            final currentUser = loggedInUser;
            if (currentUser == messageSender) {}
            ;

            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              Me: currentUser == messageSender,
            );

            messageBubbles.add(messageBubble);
          }

          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              children: messageBubbles,
            ),
          );
        });
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text, required this.Me});
  final String ? sender;
  final String? text;
  final bool Me;


  // DateTime? now = DateTime.now();
  // String? formattedDate = DateFormat('EEE, M/d/y').pattern;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            Me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$sender',
            style: TextStyle(color: Colors.blueAccent, fontSize: 15),
          ),
          // Text(
          //   '$now',
          //   style: TextStyle(color: Colors.blueAccent, fontSize: 10),
          // ),
          Material(
            borderRadius: Me? BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))

            :BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            elevation: 5,
            color: Me ? Colors.lightBlueAccent : Colors.white30,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Text('$text',
                  style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
    ;
  }
}

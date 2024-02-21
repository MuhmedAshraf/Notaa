import 'package:flutter/material.dart';
import 'package:notaa/01.auth/login.dart';
import 'package:notaa/01.auth/signeUp.dart';
import 'package:notaa/02.home/homePage.dart';
import 'package:notaa/03.curd/addnote.dart';
import 'package:notaa/03.curd/editnote.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
      routes: {
        'login': (context) => Login(),
        'signup': (context) => SignUp(),
        'home': (context) => Home(),
        'addNote': (context) => AddNote(),
        'editNote': (context) => EditNote(),

      },
      theme: ThemeData(
          primaryColor: Colors.blue,
          textTheme: TextTheme(
              headline6: TextStyle(color: Colors.white, fontSize: 20))),
    );
  }
}

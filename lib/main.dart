import 'package:flutter/material.dart';
import 'package:movo/login.dart';
//import 'movieList.dart';
void main() => runApp(MovoHome());

class MovoHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movo app',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.deepPurple,
        focusColor: Colors.purple,
        splashColor: Colors.white,
        unselectedWidgetColor: Colors.red,


      ),
      home: MyMovieHome(),
    );
  }


}

class MyMovieHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}







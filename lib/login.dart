import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movo/movieList.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
   // double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Positioned(

            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.purple[400], Colors.deepPurple[900]])),
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.only(top: 90),
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
              ),
              child: Column(
                children: <Widget>[
                 //  Image.asset('assets/images/a.png',fit:BoxFit.fitWidth,width: 100,height: 100,),

                  Padding(
                    padding: const EdgeInsets.only(bottom:5.0,top:30),
                    child: TextFormField(

                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(borderSide:
                        BorderSide(color: Colors.deepPurple)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),

                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(
                            color: Colors.blue
                        )),
                        filled: false,
                        labelText: "  Enter the Email",
                        icon: Icon(
                          Icons.person,
                          size: 30,
                        ),
                        fillColor: Colors.transparent,
                        hoverColor: Colors.black,
                        focusColor: Colors.white,
                      ),
                      controller: t1,
                      cursorColor: Colors.deepPurple,),
                  ),
                  TextFormField(
                    controller: t2,
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),

                      disabledBorder: OutlineInputBorder(borderSide: BorderSide(
                        color: Colors.blue
                      )),
                      labelText: "  Enter the password",
                      icon: Icon(
                        Icons.lock,
                        size: 30,
                      ),
                      fillColor: Colors.transparent,
                      hoverColor: Colors.black,
                      focusColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      "Forget password ?",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(right: 25, left: 25),
                    shape: StadiumBorder(),
                    color: Colors.deepPurple,
                    child: Text(
                      "       Login       ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => MovieList()));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35),
                    child: Text(
                      "-or coninue with -",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: RaisedButton(
                            padding: EdgeInsets.only(right: 30, left: 30),
                            shape: StadiumBorder(),
                            color: Colors.red[400],
                            child: Text(
                              "Google",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        RaisedButton(
                          padding: EdgeInsets.only(right: 25, left: 25),
                          shape: StadiumBorder(),
                          color: Colors.blue[700],
                          child: Text(
                            "FaceBook",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

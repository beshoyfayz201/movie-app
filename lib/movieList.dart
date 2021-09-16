
import 'dart:ui';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:movo/http_helper.dart';
//import 'package:movo/movieModel.dart';
import 'package:movo/movie_details.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return new _MovieListState();
  }
}

class _MovieListState extends State<MovieList> {
  var result;
  HttpHelper httpHelper;
  int moviesCount = 0;
  List<dynamic> theMovies;
  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

  Future initialize() async {
    theMovies = List<dynamic>();
    theMovies = await httpHelper.getUpcoming();
    setState(() {
      moviesCount = theMovies.length;
      theMovies = theMovies;
    });
  }

  @override
  void initState() {
    httpHelper = HttpHelper();
    initialize();
    super.initState();
  }
  Icon sicon=Icon(Icons.search);
  Widget lead=Text(
    "the UpComing",style: TextStyle(
      fontFamily: "ac"
      ,fontSize: 30,
      fontWeight: FontWeight.w100
  ),);

  Future search(String text)async{
List theMoviest=await httpHelper.getMovies(text);
setState(() {
 this.theMovies=theMoviest;
 moviesCount=theMovies.length;
});
  }


  @override
  Widget build(BuildContext context) {
    NetworkImage img;


    return Scaffold(
        appBar: AppBar(
         title: lead,
          backgroundColor: Colors.deepPurple[900],

          actions: <Widget>[
            IconButton(icon: sicon,onPressed: (){
              setState(() {
                if (this.sicon.icon==Icons.search){
                  print("\n\n\n\n");
                  this.sicon=Icon(Icons.cancel);
                 this.lead=TextField(
                      onSubmitted: (val){search(val);},


                  );
                }
                else{
                   sicon=Icon(Icons.search);
                   lead=Text(
                     "the UpComing",style: TextStyle(
                       fontFamily: "ac"
                       ,fontSize: 30,
                       fontWeight: FontWeight.w100
                   ),);
                }
              });
            })
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
               colors: [Colors.black,Colors.purple[900],Colors.blue,Colors.black],
              begin: Alignment.topRight,
                end: Alignment.bottomLeft
            )
          ),
          child: (theMovies.isEmpty||theMovies[0]==null)?

          Container(
              width: double.infinity,
              height: double.infinity,
              child:
          LoadingDoubleFlipping.square(backgroundColor: Colors.white.withOpacity(0.4),
          duration: Duration(milliseconds: 700),
          size: 150,)
          )
          :GridView.builder(
            itemBuilder: (BuildContext context, int index) {
              img = NetworkImage((theMovies[index].posterPath != null)
                  ? iconBase + theMovies[index].posterPath
                  : defaultImage);

              return GestureDetector(
                onTap: (){Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>
                MovieDetails(theMovies[index])));},
                child: Card(
                  color: Colors.black12,
                  child: Stack(

                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image(
                          image: img,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 130,
                        child: Card(
                          color: Colors.black38,
                          child: Text(theMovies[index].title,style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,shadows:[Shadow(color: Colors.blue[100],
                          blurRadius: 20,offset: Offset(0,0))]
                          ),),
                        ),
                      ),

                      Positioned(
                        top: 150,
                        child: Card(
                          color: Colors.black12,
                          child: Text(' Vote: ' +
                              theMovies[index].voteAverage.toString(),
                          style:TextStyle(color: Colors.white) ,),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: moviesCount,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (2),
            ),
          ),
        ));
  }
}

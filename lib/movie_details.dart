import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movo/movieModel.dart';
class MovieDetails extends StatelessWidget {
  final String imgPath='https://image.tmdb.org/t/p/w500/';
  final MovieModel movieModel;
  MovieDetails(this.movieModel);
  @override
  Widget build(BuildContext context) {
    String path;
    (movieModel.posterPath!=null)?path=imgPath+movieModel.posterPath:

        path='https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

    double height = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movieModel.title,
          style: TextStyle(
            fontFamily: 'thm'
                ,fontSize: 30,
                color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.deepPurple,

      ),
      body: SingleChildScrollView(

        child: Center(

          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin:EdgeInsets.only(top: 15,bottom: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple[600],width: 2.5)
              ),

              width: wid/1.4,
              height: height/2.4,
              child: Image.network(path,fit:
                  BoxFit.fill,),
            ),
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black38,
                          //Colors.purple[100],
                          //Colors.blue[100],
                          Colors.black],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft
                    )
                ),
              padding: EdgeInsets.only(left: 16,right: 16),
              child: Text(
                movieModel.overview,
                 style: TextStyle(
                   fontFamily: 'thm',
                   fontSize: 25,
                   color: Colors.white
                 ),
              ),
            )
          ],
          ),
        ),
      ),
    );
  }
}


import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as Http;
import 'package:movo/movieModel.dart';

class HttpHelper{
  final String urlKey='api_key=934af44882aa9747f82558475b1d70a3';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
  final String urlSearch=
      'https://api.themoviedb.org/3/search/movie?api_key=[934af44882aa9747f82558475b1d70a3]'
      '&query=';

  Future<List>getUpcoming()async{
    final String upComing=urlBase+urlUpcoming+urlKey+urlLanguage;
    Http.Response result=await Http.get(upComing);
    if(result.statusCode==HttpStatus.ok){
      final responseBode=jsonDecode(result.body);
      final moviesMap=responseBode["results"];
      List<dynamic> movies=moviesMap.map((i)=>MovieModel.fromJson(i)).toList();
      return movies;
    }
    else{
      return null;
    }


  }



 Future<List> getMovies(String ti)async{
    final String quiry=urlSearch+ti;
    Http.Response res=await Http.get(quiry);
    if(res.statusCode==HttpStatus.ok){
      final json1=jsonDecode(res.body);
      final json2=json1['results'];
      List<dynamic> serchedMovies=json2.map(
          (l) =>MovieModel.fromJson(l)).toList;
      return serchedMovies;

    }    else{
      return null;
    }




 }


}
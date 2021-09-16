class MovieModel{
  int id;
  String title;
  double voteAverage;
  String releaseDate;
  String overview;
  String posterPath;

  MovieModel(this.id, this.title, this.voteAverage, this.releaseDate,
      this.overview, this.posterPath);

  MovieModel.fromJson(Map<String,dynamic>parsedJson){
    this.id=parsedJson['id'];
    this.title=parsedJson['title'];
    this.posterPath=parsedJson['poster_path'];
    this.overview=parsedJson['overview'];
    this.voteAverage=parsedJson['vote_average']*1.0;
    this.releaseDate=parsedJson['release_date'];
  }


}
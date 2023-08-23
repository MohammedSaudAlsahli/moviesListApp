class Movie {
  num page;
  num totalPages;
  num totalResults;
  List<dynamic> keywords;
  List<Result> results;

  Movie({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.keywords,
    required this.results,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      page: json['page'],
      totalPages: json['totalPages'],
      totalResults: json['totalResults'],
      keywords: List<dynamic>.from(json['keywords']),
      results: List<Result>.from(
          json['results'].map((result) => Result.fromJson(result))),
    );
  }

  get data => null;
}

class Result {
  num? id;
  String? mediaType;
  bool? adult;
  List<num>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
  String? backdropPath;
  String? posterPath;

  Result({
    this.id,
    this.mediaType,
    this.adult,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.backdropPath,
    this.posterPath,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      mediaType: json['mediaType'],
      adult: json['adult'],
      genreIds: List<num>.from(json['genreIds']),
      originalLanguage: json['originalLanguage'],
      originalTitle: json['originalTitle'],
      overview: json['overview'],
      popularity: json['popularity'],
      releaseDate: json['releaseDate'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['voteAverage'],
      voteCount: json['voteCount'],
      backdropPath: json['backdropPath'],
      posterPath: json['posterPath'],
    );
  }
}

/*
{
	"page": 1,
	"totalPages": 39662,
	"totalResults": 793222,
	"keywords": [],
	"results": [
		{
			"id": 976573,
			"mediaType": "movie",
			"adult": false,
			"genreIds": [
				16,
				35,
				10751,
				14,
				10749
			],
			"originalLanguage": "en",
			"originalTitle": "Elemental",
			"overview": "In a city where fire, water, land and air residents live together, a fiery young woman and a go-with-the-flow guy will discover something elemental: how much they have in common.",
			"popularity": 4863.437,
			"releaseDate": "2023-06-14",
			"title": "Elemental",
			"video": false,
			"voteAverage": 7.8,
			"voteCount": 1239,
			"backdropPath": "/jZIYaISP3GBSrVOPfrp98AMa8Ng.jpg",
			"posterPath": "/6oH378KUfCEitzJkm07r97L0RsZ.jpg"
		}
	]
}*/
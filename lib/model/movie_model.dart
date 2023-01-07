class Movie {
  List<dynamic> results = [];

  Movie({
    required this.results,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    results = json['results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results;
    return data;
  }
}
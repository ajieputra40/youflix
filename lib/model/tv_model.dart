class Tv {
  List<dynamic> results = [];

  Tv({
    required this.results,
  });

  Tv.fromJson(Map<String, dynamic> json) {
    results = json['results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results;
    return data;
  }
}
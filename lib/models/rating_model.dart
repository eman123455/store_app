class RatingModel {
  final num rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromjson(json) {
    return RatingModel(rate: json["rate"], count: json["count"]);
  }
}

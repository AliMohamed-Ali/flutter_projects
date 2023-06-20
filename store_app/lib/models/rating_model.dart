class RatingModel {
  final int count;
  final dynamic rate;
  RatingModel({required this.count, required this.rate});
  factory RatingModel.fromJson(jsondata) {
    return RatingModel(count: jsondata['count'], rate: jsondata['rate']);
  }
}

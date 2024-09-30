class MealModel {
  final String? mealName;
  final double? price;
  final String? imageURL;

  MealModel({
    this.mealName,
    this.price,
    this.imageURL,
  });

  factory MealModel.fromJSON(Map json) {
    return MealModel(
      mealName: json['mealName'],
      price: json['price'],
      imageURL: json['imageURL'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'mealName': mealName,
      'price': price,
      'imageURL': imageURL,
    };
  }

  copyWith({
    String? mealName,
    double? price,
    String? imageURL,
  }) {
    return MealModel(
      mealName: mealName ?? this.mealName,
      price: price ?? this.price,
      imageURL: imageURL ?? this.imageURL,
    );
  }
}

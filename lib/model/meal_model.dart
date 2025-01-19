///
/// Contains the meal's id, category id, name, price, images, created at time,
/// quantity, preparing time and description.
///
/// Also contains methods to create a [MealModel] from a JSON object and to
/// convert a [MealModel] to a JSON object.
class MealModel {
  /// The id of the meal.
  final String? id;

  /// The id of the category the meal belongs to.
  final String? categoryId;

  /// The name of the meal.
  final String? name;

  /// The price of the meal.
  final double? price;

  /// The list of images of the meal.
  final List<String>? images;

  /// The time the meal was created.
  final String? createdAt;

  /// The quantity of the meal.
  final int? quantity;

  /// The preparing time of the meal.
  final int? preparingTime;

  /// The description of the meal.
  final String? description;

  /// Constructor to create a [MealModel].
  /// [id], [categoryId], [name], [price], [images], [createdAt], [quantity],
  /// [preparingTime] and [description] are the properties of the meal.
  MealModel({
    this.id,
    this.categoryId,
    this.name,
    this.createdAt,
    this.price,
    this.images,
    this.quantity,
    this.preparingTime,
    this.description,
  });

  /// Factory method to create a [MealModel] from a JSON object.
  ///
  /// [json] is the JSON object to create the meal from.
  factory MealModel.fromJSON(Map json) {
    return MealModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      price: json['price'],
      images: (json['images'] as List<dynamic>).cast<String>(),
      createdAt: json['created_at'],
      quantity: json['quantity'],
      preparingTime: json['preparing_time'],
      description: json['product_description'],
    );
  }

  /// Method to convert a [MealModel] to a JSON object.
  ///
  /// Returns a [Map] containing the meal's properties.
  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'price': price,
      'images': images,
      'created_at': createdAt,
      'quantity': quantity,
      'preparing_time': preparingTime,
      'product_description': description,
      'id': id,
      'category_id': categoryId,
    };
  }

  /// Method to create a copy of a [MealModel] with new properties.
  ///
  /// [name], [price], [images], [createdAt], [quantity], [preparingTime],
  /// [description], [id] and [categoryId] are the new properties of the meal.
  MealModel copyWith({
    String? name,
    String? createdAt,
    double? price,
    List<String>? images,
    int? quantity,
    int? preparingTime,
    String? description,
    String? id,
    String? categoryId,
  }) {
    return MealModel(
      name: name ?? this.name,
      price: price ?? this.price,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      quantity: quantity ?? this.quantity,
      preparingTime: preparingTime ?? this.preparingTime,
      description: description ?? this.description,
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}

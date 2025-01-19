class CategoryModel {
  final String? name;
  final String? imageUrl;
  final String? createdAt;
  final String? description;
  final String? id;

  CategoryModel(
      {this.name, this.imageUrl, this.createdAt, this.id, this.description});
  factory CategoryModel.fromJSON(Map json) {
    return CategoryModel(
      name: json['name'],
      imageUrl: json['image_url'],
      createdAt: json['createdAt'],
      id: json['id'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'image_url': imageUrl,
      'createdAt': createdAt,
      'id': id,
      'description': description,
    };
  }

  CategoryModel copyWith({
    String? name,
    String? imageUrl,
    String? createdAt,
    String? id,
    String? description,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'CategoryModel{name: $name, imageUrl: $imageUrl, createdAt: $createdAt, id: $id}';
  }
}

import 'dart:convert';

class ProductModel {
  int id;
  String name;
  String description;
  double price;
  String createdAt;
  String updatedAt;
  List<String> images;
  double rating;
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
    required this.rating,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    String? createdAt,
    String? updatedAt,
    List<String>? images,
    double? rating,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      images: images ?? this.images,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'images': images,
      'rating': rating,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    List<String> images = [];
    map['images'].map((e) {
      images.add(e as String);
    }).toList();
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      images: images,
      rating: map['rating'].toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

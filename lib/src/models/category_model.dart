import 'dart:convert';

class CategoryModel {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  CategoryModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  CategoryModel copyWith({
    int? id,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  int id;
  String email;
  String name;
  String? emailVerifiedAt;
  String createdAt;
  String updatedAt;
  bool isAdmin;
  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isAdmin,
  });

  UserModel copyWith({
    int? id,
    String? email,
    String? name,
    String? emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
    bool? isAdmin,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'emailVerifiedAt': emailVerifiedAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isAdmin': isAdmin,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      name: map['name'] as String,
      emailVerifiedAt: map['email_verified_at'] != null ? map['email_verified_at'] as String : null,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      isAdmin: map['is_admin'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

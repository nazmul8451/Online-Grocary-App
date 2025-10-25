class UserModel {
  final int id;
  final String name;
  final String createdAt;
  final String? email;

  UserModel({
    required this.id,
    required this.name,
    required this.createdAt,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'],
      name: jsonData['name'] ?? '',
      createdAt: jsonData['createdAt'] ?? '',
      email: jsonData['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'email': email,
    };
  }
}

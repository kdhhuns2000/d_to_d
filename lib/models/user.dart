class User {
  late int id;
  late String userId;
  late String password;
  late String category;
  late String nickname;
  String? profileImage;
  List<String>? posts;

  static final User _instance = User._internal();

  factory User({
    int? id,
    String? userId,
    String? password,
    String? category,
    String? nickname,
    String? profileImage,
    List<String>? posts,
  }) {
    return _instance;
  }

  User._internal();

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      id: jsonData['id'],
      userId: jsonData['userId'],
      password: jsonData['password'],
      nickname: jsonData['nickname'],
      category: jsonData['category'],
      profileImage: jsonData['profileImage'],
      posts: List<String>.from(jsonData['posts']),
    );
  }
}

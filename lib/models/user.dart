class User {
  late int id;
  late String userId;
  late String password;
  late String category;
  String? nickname;
  String? profileImage;
  List<String>? posts;

  static final User _instance = User._internal();

  factory User({
    required int id,
    required String userId,
    required String password,
    required String category,
    String? nickname,
    String? profileImage,
    List<String>? posts,
  }) {
    _instance.id = id;
    _instance.userId = userId;
    _instance.password = password;
    _instance.category = category;
    _instance.nickname = nickname;
    _instance.profileImage = profileImage;
    _instance.posts = posts;
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

  static User getInstance() {
    return _instance;
  }
}

class Post {
  int id;
  DateTime createdDate;
  String category;
  int userId;
  String writer;
  String title;
  String content;
  String image;

  Post({
    required this.id,
    required this.createdDate,
    required this.category,
    required this.userId,
    required this.writer,
    required this.title,
    required this.content,
    required this.image,
  });

  factory Post.fromJson(Map<String, dynamic> jsonData) {
    return Post(
      id: jsonData['id'],
      createdDate: DateTime.parse(jsonData['created_date']),
      category: jsonData['category'],
      userId: jsonData['user_id'],
      writer: jsonData['user_nickname'],
      title: jsonData['title'],
      content: jsonData['content'],
      image: jsonData['postImg'],
    );
  }
}

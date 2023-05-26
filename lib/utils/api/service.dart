import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:d_to_d/models/user.dart';
import 'package:d_to_d/models/post.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Service {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://15.165.26.250:8080/',
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  static Future<String?> login(String userId, String password) async {
    try {
      Response response = await _dio.get(
        '/users/login',
        queryParameters: {
          'userId': userId,
          'password': password,
        },
      );

      if (response.data['code'] == 200) {
        int id = response.data['result']['id'];
        String? result = await getUser(id).then((user) => user.nickname);
        return result;
      } else {
        return 'Login Fail';
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<User> getUser(int id) async {
    try {
      Response response = await _dio.get(
        '/users/profile/$id',
        options: Options(responseType: ResponseType.json),
      );
      User user = User.fromJson(response.data['result']);
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    try {
      Response response = await _dio.get(
        '/posts',
        options: Options(responseType: ResponseType.json),
      );
      for (var post in response.data['content']) {
        posts.add(Post.fromJson(post));
      }
      return posts;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Post> getPost(String postId) async {
    try {
      Response response = await _dio.get(
        '/posts/$postId',
        options: Options(responseType: ResponseType.json),
      );
      Post post = Post.fromJson(response.data['result']);
      return post;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<bool> addPost(int userId, String title, String content,
      String category, String filePath) async {
    try {
      final postCreateRequestDto = jsonEncode({
        'userId': userId,
        'title': title,
        'content': content,
        'category': category,
      });

      final formData = FormData.fromMap({
        'postCreateRequestDto': postCreateRequestDto,
        'file': MultipartFile.fromFileSync(filePath)
      });
      Response response = await _dio.post('/posts', data: formData);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static User getUser123() {
    return User.getInstance();
  }
}

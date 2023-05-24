import 'package:dio/dio.dart';
import 'package:d_to_d/models/user.dart';
import 'package:d_to_d/models/post.dart';

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
}

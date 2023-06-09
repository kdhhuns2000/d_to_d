import 'dart:convert';
import 'dart:typed_data';
import 'package:d_to_d/models/message.dart';
import 'package:dio/dio.dart';
import 'package:d_to_d/models/user.dart';
import 'package:d_to_d/models/post.dart';
import 'package:uuid/uuid.dart';

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
      String category, Uint8List bytes) async {
    try {
      final postCreateRequestDto = jsonEncode({
        'userId': userId,
        'title': title,
        'content': content,
        'category': category,
      });
      final uuid = Uuid();
      final formData = FormData.fromMap({
        'postCreateRequestDto': postCreateRequestDto,
        'file': MultipartFile.fromBytes(bytes, filename: uuid.v4()),
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

  static Future<int> createMessage(
      int requestUserId, int responseUserId) async {
    try {
      final createMessageDto = jsonEncode({
        'requestUserId': requestUserId,
        'responseUserId': responseUserId,
      });

      Response response = await _dio.post('/message', data: createMessageDto);

      if (response.data['code'] == 200) {
        int id = response.data['result']['id'];
        return id;
      } else {
        return 0;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> deleteMessage(int id) async {
    try {
      Response response = await _dio.delete('/message', data: id);

      if (response.data['code'] == 200) {
        return "ok";
      } else {
        return "fail";
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Message>> getMessages(int id) async {
    List<Message> msgList = [];
    try {
      Response response = await _dio.get('/message/all?id=$id');

      print(response.data['result']['messages']);
      print(response.data['result']['messages'][0]['requestUserId']);
      print(response.data['result']['messages'][0]['responseUserId']);
      print(response.data['result']['messages'][1]['requestUserId']);
      print(response.data['result']['messages'][1]['responseUserId']);
      for (var m in response.data['result']['messages']) {
        print(m);
        print(m['requestUserId']);
        print(User.getInstance().id);
        int id;
        if (m['requestUserId'] == User.getInstance().id) {
          id = m['responseUserId'];
          print(id);
          response = await _dio.get(
            '/users/profile/$id',
            options: Options(responseType: ResponseType.json),
          );
        } else {
          id = m['requestUserId'];
          print(id);
          response = await _dio.get(
            '/users/profile/$id',
            options: Options(responseType: ResponseType.json),
          );
        }
        msgList.add(Message(
          id: m['id'],
          targetUserId: response.data['result']['id'].toString(),
          targetUserName: response.data['result']['nickname'].toString(),
          targetUserCategory: response.data['result']['category'].toString(),
        ));

        print(msgList);
      }

      return msgList;
    } catch (e) {
      throw Exception(e);
    }
  }

  static User getUser123() {
    return User.getInstance();
  }
}

class GetMessageDto {
  int id;
  String userId;
  String userNickname;
  String userCategory;

  GetMessageDto(
      {required this.id,
      required this.userId,
      required this.userNickname,
      required this.userCategory});
}

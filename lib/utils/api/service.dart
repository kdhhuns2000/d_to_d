import 'package:dio/dio.dart';
import 'package:d_to_d/models/user.dart';

class Service {
  static var dio = Dio(
    BaseOptions(
      baseUrl: 'http://15.165.26.250:8080/',
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  static Future<String?> login(String userId, String password) async {
    try {
      Response response = await dio.get(
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
      Response response = await dio.get(
        '/users/profile/$id',
        options: Options(responseType: ResponseType.json),
      );
      User user = User.fromJson(response.data['result']);
      // print(user.nickname);
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}

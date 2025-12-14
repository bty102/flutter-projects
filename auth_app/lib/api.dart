import 'package:auth_app/model/token.dart';
import 'package:auth_app/model/user.dart';
import 'package:dio/dio.dart';

class Api {
  Future<Token?> login(String username, String password) async {
    Token? token = null;
    var dio = Dio();
    String url = 'https://dummyjson.com/auth/login';
    try {
      var response = await dio.post(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {"username": username, "password": password, "expiresInMins": 10},
      );

      if (response.statusCode == 200) {
        token = Token.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioException catch (e) {}
    return token;
  }

  Future<User?> getCurrentAuthUser(String accessToken) async {
    User? user = null;
    var dio = Dio();
    String url = 'https://dummyjson.com/auth/me';
    try {
      var response = await dio.get(
        url,
        options: Options(headers: {'Authorization': "Bearer ${accessToken}"}),
      );
      if (response.statusCode == 200) {
        user = User.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioException catch (e) {}
    return user;
  }
}

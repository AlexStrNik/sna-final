import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:front/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends ChangeNotifier {
  User? user;

  AuthNotifier() {
    SharedPreferences.getInstance().then((value) async {
      final token = value.getString('token');
      if (token != null) {
        var dio = Dio();
        final response = await dio.get(
          'https://rultor.pro/api/user',
          options: Options(
            headers: {'Token': token},
          ),
        );
        Map<String, dynamic> rawUser = response.data;
        rawUser.addAll({'token': token});
        user = User.fromJson(rawUser);
        notifyListeners();
      }
    });
  }

  Future<void> proceedOAuth() async {
    const GITHUB_CLIENT_ID = 'f687e66e26d3e7abd5ba';
    final url = Uri.https(
      'github.com',
      'login/oauth/authorize',
      {
        'client_id': GITHUB_CLIENT_ID,
        'scope': 'repo,admin:repo_hook',
      },
    );
    final token = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: 'my-custom-app');
    var dio = Dio();
    final response = await dio.get(
      'https://rultor.pro/api/user',
      options: Options(
        headers: {'Token': token},
      ),
    );
    Map<String, dynamic> rawUser = response.data;
    rawUser.addAll({'token': token});
    user = User.fromJson(rawUser);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    notifyListeners();
  }
}

final authProvider = ChangeNotifierProvider<AuthNotifier>((ref) {
  return AuthNotifier();
});

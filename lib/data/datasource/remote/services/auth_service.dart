import 'dart:convert';

import 'package:indriver_clone/data/api/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:indriver_clone/domain/models/auth_response.dart';
import 'package:indriver_clone/domain/models/user.dart';
import 'package:indriver_clone/domain/utils/list_to_string.dart';
import 'package:indriver_clone/domain/utils/resource.dart';

class AuthService {
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/auth/login');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = json.encode({
        'email': email,
        'password': password,
      });
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        print('Data remote: ${authResponse.toJson()} ');
        print('Token: ${authResponse.token}');
        return Success(authResponse);
      } else {
        return ErrorData(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return ErrorData(e.toString());
    }
  }

  Future<Resource<AuthResponse>> register(User user) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/auth/register');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = json.encode(user);
      print("body ${body}");
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        print("Data remote: ${authResponse.token}");
        print("Token: ${authResponse.toJson()}");

        return Success(authResponse);
      }
      return ErrorData(listToString(data['message']));
    } catch (e) {
      return ErrorData("${e.toString}");
    }
  }
}

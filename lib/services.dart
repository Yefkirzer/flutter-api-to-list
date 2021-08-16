import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  static Future<List<User>> getUser() async {
    try {
      String url = 'https://reqres.in/api/users?page=2';
      var uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print(response.statusCode);
        final List<User> user = userFromJson(response.body);
        return user;
      } else {
        print('failed');
        return <User>[];
      }
    } catch (e) {
      print(e.toString());
      return <User>[];
    }
  }
}

List<User> userFromJson(String string) =>
    List<User>.from(json.decode(string)["data"].map((x) => User.fromJson(x)));

class User {
  String email = '';
  String first_name = '';
  String last_name = '';
  String avatar = '';

  User(
      {required this.email,
      required this.avatar,
      required this.first_name,
      required this.last_name});

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        avatar: json['avatar'],
      );
  Map<String, dynamic> toJson() => {
        'emial': email,
        'firat_name': first_name,
        'last_name': last_name,
        'avatar': avatar,
      };
  static List<User> user = [];
}

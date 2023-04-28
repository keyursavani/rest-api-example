import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/user_dob.dart';
import 'package:rest_api/models/user_location.dart';
import '../models/user.dart';
import '../models/user_name.dart';
//
// class UserApi{
//  static Future<List<User>> fetchUser() async {
//     const url = "http://f6transport.hyvikk.solutions/api/vehicle-types";
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     final results = json['data'] as List<dynamic>;
//     final users = results.map((e) {
//       return User.fromeMap(e);
//     }).toList();
//     return users;
//   }
// }

class UserApi{
  static Future<List<User>> fetchUser() async {
    const url = "https://randomuser.me/api/?results=50";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      return User.fromeMap(e);
    }).toList();
    return users;
  }
}
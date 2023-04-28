import 'package:rest_api/models/user_dob.dart';
import 'package:rest_api/models/user_location.dart';
import 'package:rest_api/models/user_name.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;

  User({
    required this.phone,
    required this.email,
    required this.cell,
    required this.gender,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
});

  factory User.fromeMap(Map<String, dynamic> e){
    final name = UserName.fromMap(e['name']);
  final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
    return User(
      phone: e['phone'],
      email: e['email'],
      cell: e['cell'],
      gender: e['gender'],
      nat: e['nat'],
      name: name,
      dob:  dob,
      location: location,
    );
  }
  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}


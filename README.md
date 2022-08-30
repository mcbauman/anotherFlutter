# second_flutter
Small Excercise to build an first App as ToDo List. Shall have the same look and functionality as the website. It will work with an own Storage but syncronise to the server too.


import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class UserClass {
  UserClass({required this.name, required this.email, required this.password});
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String email;

  @HiveField(3)
  late String password;
}
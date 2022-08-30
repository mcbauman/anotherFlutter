import 'package:hive/hive.dart';

part 'Classes.g.dart';

@HiveType(typeId: 1) //extends HiveObject
class ItemClass extends HiveObject {
  ItemClass(
      {required this.userId, required this.name, required this.discription});
  @HiveField(0)
  late int id;

  @HiveField(1)
  late int userId;

  @HiveField(2)
  late String name;

  @HiveField(3)
  late String discription;
}

// @HiveType(typeId: 0)
// class UserClass extends HiveObject {
//   UserClass({required this.name, required this.email, required this.password});
//   @HiveField(0)
//   late int id;

//   @HiveField(1)
//   late String name;

//   @HiveField(2)
//   late String email;

//   @HiveField(3)
//   late String password;
// }

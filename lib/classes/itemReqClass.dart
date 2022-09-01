class ItemReqClass {
  final int id;
  final String name;
  final String discription;
  final int userId;
  ItemReqClass(
      {required this.id,
      required this.name,
      required this.discription,
      required this.userId});
  factory ItemReqClass.fromJson(Map<String, dynamic> json) {
    return ItemReqClass(
        id: json['id'] as int,
        name: json['name'] as String,
        discription: json['dicription'] as String,
        userId: json['userId'] as int);
  }

  @override
  String toString() {
    return 'itemReqClass{id:$id, name:$name, discription: $discription, userId: $userId';
  }
}

import 'package:second_flutter/classes/itemClass.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<ItemClass>> getRequest(String tkn) async {
  var api = Uri.http("todolistmcb.herokuapp.com", "getItems");
  var response = await http.post(api, headers: {
    "Content-Type": "application/json",
    "Authorization": "Bearer $tkn"
  });
  var responseData = json.decode(response.body);
  List<ItemClass> reqItems = [];
  for (var singleUser in responseData) {
    ItemClass user = ItemClass(
        userId: singleUser["UserId"],
        name: singleUser["itemName"],
        discription: singleUser["discription"]);
    reqItems.add(user);
  }
  return reqItems;
}

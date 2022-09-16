import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> logInUser(String name, String password) async {
  var x = await http.post(Uri.parse('http://todolistmcb.herokuapp.com/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'name': name, 'password': password}));
  return x.body;
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/classes/itemClass.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2MmY0MDEzY2I3ZmNiMzg2NjQ4ZGE1NWMiLCJpYXQiOjE2NjMwNjE0ODYsImV4cCI6MTY2MzE0Nzg4Nn0.zo3bHi_pBANsWBSGfNo3fB5gwsp1JbfQS6X5wV19OzY";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<ItemClass>> getRequest() async {
      var api = Uri.http("todolistmcb.herokuapp.com", "getItems");
      var response = await http.post(api, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      print('Response body: ${response.body}');
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

    return ChangeNotifierProvider(
        create: (context) => SettingsScreenNotifier(),
        builder: (context, provider) {
          return Consumer<SettingsScreenNotifier>(
            builder: (context, notifier, child) {
              return MaterialApp(
                  title: 'Welcome to Flutter',
                  home: Stack(children: [
                    Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/img1.jpeg"),
                                fit: BoxFit.cover))),
                    Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                          flexibleSpace: ClipRRect(
                              child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container())),
                          elevation: 0,
                          leading: const IconButton(
                              onPressed: null, icon: Icon(Icons.dark_mode)),
                          title: Text(
                            notifier.currentUSer == "0"
                                ? "LogIn"
                                : "${notifier.currentUSer}'s ToDoList",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => {notifier.switchUser("0")},
                                child: const Text(
                                  "Logout",
                                )),
                          ],
                          backgroundColor:
                              const Color.fromARGB(100, 255, 255, 255)),
                      body: notifier.currentUSer == "0"
                          ? const Login()
                          : Container(
                              margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                              child: FutureBuilder(
                                  future: getRequest(),
                                  builder: (BuildContext ctx,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.data == null) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return ListView.builder(
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (ctx, index) => ListItem(
                                              item: snapshot.data[index]));
                                    }
                                  })),
                      floatingActionButton: FloatingActionButton(
                          tooltip: 'Add',
                          onPressed: null,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          child: ClipRRect(
                              child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                180, 255, 255, 255),
                                            width: 1),
                                        color: const Color.fromARGB(
                                            45, 255, 255, 255)),
                                    child: const Icon(Icons.add),
                                  )))),
                    )
                  ]));
            },
          );
        });
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsScreenNotifier>(
        builder: (context, notifier, child) {
      return Form(
        child: Column(
          children: <Widget>[
            Text(notifier.currentUSer),
            TextFormField(
                decoration: const InputDecoration(hintText: 'Enter your name')),
            TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Enter your password')),
            IconButton(
                onPressed: () => {notifier.switchUser("2")},
                icon: const Icon(Icons.login))
          ],
        ),
      );
    });
    //});
  }
}

class ListItem extends StatefulWidget {
  const ListItem({Key? key, required this.item}) : super(key: key);

  final ItemClass item;
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(
                            color: const Color.fromARGB(180, 255, 255, 255),
                            width: 1),
                        color: const Color.fromARGB(100, 255, 255, 255)),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                              checkColor: Colors.white,
                              value: checked,
                              onChanged: (bool? value) {
                                setState(() {
                                  checked = value!;
                                });
                              }),
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    widget.item.name,
                                    style: const TextStyle(fontSize: 20),
                                    //textAlign: TextAlign.center,
                                  ))),
                          Expanded(
                              child: Text(
                            widget.item.discription,
                            style: const TextStyle(fontSize: 20),
                            //textAlign: TextAlign.center,
                          ))
                        ])))));
  }
}

class SettingsScreenNotifier extends ChangeNotifier {
  String _currentUser = "2";
  get currentUSer => _currentUser;
  void switchUser(String newUser) {
    _currentUser = newUser;
    notifyListeners();
  }
}

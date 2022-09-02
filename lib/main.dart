import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:second_flutter/classes/itemClass.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2MmY0MDEzY2I3ZmNiMzg2NjQ4ZGE1NWMiLCJpYXQiOjE2NjIxMDAyODEsImV4cCI6MTY2MjE4NjY4MX0.0-WO-hHx4_F1YdfTAzp5x_0Gw7QmuYKiPriqpnDzfYM";
int user = 2;
void main() {
  runApp(const MyApp2());
}

//https://todolistmcb.herokuapp.com
class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  //int user = 2;
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

    return MaterialApp(
        title: 'Welcome to Flutter',
        // themeMode: ThemeMode.system,
        // theme: MyThemes.lightTheme,
        // darkTheme: MyThemes.darkTheme,
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
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container())),
                elevation: 0,
                leading: const IconButton(
                    onPressed: null, icon: Icon(Icons.dark_mode)),
                title: Text(
                  user == 0 ? "LogIn" : "$user's ToDoList",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () => {
                            setState(() {
                              user = 0;
                            }),
                            print(user)
                          },
                      child: Text(
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          "Logout")),
                ],
                backgroundColor: const Color.fromARGB(100, 255, 255, 255)),
            body: user == 0
                ? Login()
                : Container(
                    margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: FutureBuilder(
                        future: getRequest(),
                        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (ctx, index) =>
                                    ListItem(item: snapshot.data[index]));
                          }
                        })),
            floatingActionButton: FloatingActionButton(
                tooltip: 'Add',
                onPressed: null,
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(180, 255, 255, 255),
                                  width: 1),
                              color: const Color.fromARGB(45, 255, 255, 255)),
                          child: const Icon(Icons.add),
                        )))),
          )
        ]));
  }
}

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(user.toString()),
          TextFormField(
              decoration: const InputDecoration(hintText: 'Enter your name')),
          TextFormField(
              decoration:
                  const InputDecoration(hintText: 'Enter your password')),
          IconButton(
              onPressed: () {
                print("Login-Submit-Pressed");
                setState(() {
                  user = 2;
                });
                print(user);
              },
              icon: const Icon(Icons.login))
          // Add TextFormFields and ElevatedButton here.
        ],
      ),
    );
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









// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Welcome to Flutter',
//         home: Scaffold(
//           appBar: AppBar(
//               title: const Text(
//                 'Welcome to Flutter',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 229, 143, 38),
//                 ),
//               ),
//               backgroundColor: const Color.fromARGB(255, 10, 61, 98)),
//           body: Center(
//               child: Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/img1.jpeg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             width: 1248,
//             child: Column(
//               children: [
//                 Container(
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                       // boxShadow: <BoxShadow>[
//                       //   BoxShadow(
//                       //     color: Color.fromARGB(255, 0, 0, 0),
//                       //     offset: Offset(10, 2),
//                       //     blurRadius: 10,
//                       //   ),
//                       // ],
//                       // shape: BoxShape.circle,
//                       // gradient: LinearGradient(
//                       //   begin: Alignment(0, -1),
//                       //   end: Alignment(0, 1),
//                       //   colors: <Color>[
//                       //     Color.fromARGB(255, 7, 153, 146),
//                       //     Color.fromARGB(255, 229, 143, 38),
//                       //     Color.fromARGB(255, 7, 153, 146),
//                       //   ],
//                       // ),
//                     ),
//                     padding: const EdgeInsets.all(16),
//                     width: 256,
//                     height: 128,
//                     child: ClipRRect(
//                         // borderRadius: Column.radius,
//                         child: BackdropFilter(
//                             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                             child: const Center(
//                               child: Text(
//                                 'first Hello World',
//                                 // overflow: TextOverflow.ellipsis,
//                                 // maxLines: 2,
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                     fontFamily: "Georgia",
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             )))),
//                 Container(
//                     width: 256,
//                     height: 64,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.black,
//                         width: 1,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(50),
//                       ),
//                       // gradient: const LinearGradient(
//                       //   begin: Alignment(1, -1),
//                       //   end: Alignment(1, 1),
//                       //   colors: <Color>[
//                       //     Color.fromARGB(0, 255, 255, 255),
//                       //     Color.fromARGB(183, 255, 255, 255),
//                       //     Color.fromARGB(0, 255, 255, 255),
//                       //   ],
//                       // ),
//                     ),
//                     child: ClipRRect(
//                         // borderRadius: Column.radius,
//                         child: BackdropFilter(
//                             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                             child: const Center(
//                               child: Text(
//                                 'Second World',
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                     fontFamily: "Georgia",
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ))))
//               ],
//             ),
//           )),
//         ));
//   }
// }
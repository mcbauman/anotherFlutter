import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:second_flutter/classes/itemClass.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String token =
    "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMiIsImV4cCI6MTY2MjEwNTk3Mn0.H41Ec3CXo5DoxM5JziyqtxZBtfoIH0Gd_qsjKz9udIXh8t9jufxzQfFfw6zHqTT0MwnCeTjzG5yw2Nzz0qpz0w";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ItemClass item = ItemClass(
        userId: 2, name: "firstTask", discription: "Created by Flutter");
    ItemClass item2 = ItemClass(
        userId: 2, name: "secondTask", discription: "also created by Flutter");
    ItemClass item3 = ItemClass(
        userId: 2,
        name: "thirdTask",
        discription: "and a third created by Flutter");
    //List<ItemClass> items = [item3, item2, item];
    final items = <ItemClass>[item3, item2, item];
    items.forEach((element) => print(element.name));
    String user = "Matthias";

    Future<List<ItemClass>> getRequest() async {
      //replace your restFull API here.
      var api = Uri.http("http://localhost:5004", "getItems");
      final response = await http.get(api);

      var responseData = json.decode(response.body);

      //Creating a list to store input data;
      List<ItemClass> reqItems = [];
      for (var singleUser in responseData) {
        ItemClass user = ItemClass(
            userId: singleUser["userId"],
            name: singleUser["name"],
            discription: singleUser["discription"]);

        //Adding user to the list.
        reqItems.add(user);
      }
      reqItems.forEach((element) {
        print(element.discription);
      });
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
                elevation: 0,
                leading: const IconButton(
                    onPressed: null, icon: Icon(Icons.dark_mode)),
                title: Text(
                  user == "" ? "LogIn" : "$user's ToDoList",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                backgroundColor: const Color.fromARGB(130, 255, 255, 255)),
            body:
                // Body
                Container(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder(
                future: getRequest(),
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, index) => ListTile(
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].body),
                        contentPadding: EdgeInsets.only(bottom: 20.0),
                      ),
                    );
                  }
                },
              ),
            ),

//            Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
//                children: [
//                  ListItem(item: item2),
//                  ListItem(item: item2),
//                  ListItem(item: item3),
            // Expanded(child: ListItem(item: item)),
            //for (int i=0;i<items.length;i++){ListItem(item: items[i])},
            // items.forEach((element) {
            //   print(element.name);
            // })
            //     for (var element in items) {print(element.name);},
            // items.map((e) => print(e.discription))
            // items.forEach((element)=>ListItem(item:element)),
            // ListItem(),
            // ListItem(),
            // ListItem(),
            // ListItem(),
            // ListItem(),
            // ListItem(),
            // ListItem(),
//                ]),
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

class ListItem extends StatefulWidget {
  const ListItem({Key? key, required this.item}) : super(key: key);

  final ItemClass item;
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
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
                        color: const Color.fromARGB(45, 255, 255, 255)),
                    child: Row(children: [
                      Expanded(
                          child: Text(
                        widget.item.name,
                        style: const TextStyle(fontSize: 20),
                        //textAlign: TextAlign.center,
                      )),
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
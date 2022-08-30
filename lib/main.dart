import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:second_flutter/Classes.dart';

late var box;
Future<void> main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('Box');
  Hive.registerAdapter(ItemClassAdapter());
  box.put(
      'itemClass',
      ItemClass(
          userId: 2,
          name: "task from Flutter",
          discription: "But Still hardcoded"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ItemClass item = box.get("itemClass");
    print(item);
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
                  elevation: 0,
                  flexibleSpace: ClipRRect(
                      child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  )),
                  //backgroundColor: Colors.transparent,
                  title: const Text(
                    'ToDoList',
                    style: TextStyle(
                      backgroundColor: Colors.transparent,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(130, 255, 255, 255)),
              body: Center(
                  child: Column(children: [
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
              ])))
        ]));
  }
}

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

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
                    child: const Center(
                        child: Text(
                      'first Hello World',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ))))));
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
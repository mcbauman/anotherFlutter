import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(
              title: const Text(
                'Welcome to Flutter',
                style: TextStyle(
                  color: Color.fromARGB(255, 229, 143, 38),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 10, 61, 98)),
          body: Center(
              child: Container(
            color: const Color.fromARGB(255, 7, 153, 146),
            width: 1248,
            child: Column(
              children: [
                Container(
                    // width: 256,
                    // height: 64,
                    decoration: const BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0),
                          offset: Offset(10, 2),
                          blurRadius: 10,
                        ),
                        // BoxShadow(
                        //   color: Color(0x80000000),
                        //   offset: Offset(0, 6),
                        //   blurRadius: 20,
                        // ),
                      ],
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.all(
                      //   Radius.circular(50),
                      // ),
                      gradient: LinearGradient(
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[
                          Color.fromARGB(255, 7, 153, 146),
                          Color.fromARGB(255, 229, 143, 38),
                          Color.fromARGB(255, 7, 153, 146),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    width: 160,
                    height: 160,
                    child: const Center(
                      child: Text(
                        'first Hello World',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Color.fromARGB(255, 248, 195, 145),
                            fontFamily: "Georgia",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )),
                Container(
                    width: 256,
                    height: 64,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(1, -1),
                        end: Alignment(1, 1),
                        colors: <Color>[
                          Color(0x00ef5350),
                          Color.fromARGB(255, 229, 143, 38),
                          Color(0x00ef5350),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Second World',
                        style: TextStyle(
                            color: Color.fromARGB(255, 248, 195, 145),
                            fontFamily: "Georgia",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ),
          )),
        ));
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Welcome to Flutter'),
//         ),
//         body: const Center(
//             child: Text(
//           'Hello World',
//           style: TextStyle(
//               color: Colors.brown,
//               fontFamily: "Georgia",
//               fontSize: 30,
//               fontWeight: FontWeight.bold),
//           textAlign: TextAlign.start,
//         )),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }



// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), 
//     );
//   }
// }

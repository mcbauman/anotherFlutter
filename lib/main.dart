import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:second_flutter/Widgets/Login.dart';
import 'package:second_flutter/Widgets/ListItem.dart';

import 'Widgets/ChangeNotigier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  set tkn(tkn) {}
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SettingsScreenNotifier(),
        builder: (context, provider) {
          return Consumer<SettingsScreenNotifier>(
            builder: (context, notifier, child) {
              return MaterialApp(
                  title: 'Welcome to Flutter',
                  theme: ThemeData(
                      textTheme: Theme.of(context)
                          .textTheme
                          .apply(bodyColor: Colors.black)),
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
                            notifier.currentUSer == "0" ? "LogIn" : "ToDoList",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
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
                      body:
                          notifier.currentUSer == "0" ? Login() : const ToDo(),
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

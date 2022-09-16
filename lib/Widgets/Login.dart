import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ChangeNotigier.dart';
import 'package:second_flutter/Functions/LoginFunction.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  late String name;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsScreenNotifier>(
        builder: (context, notifier, child) {
      return Form(
        child: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        180, 255, 255, 255),
                                    width: 1),
                                color:
                                    const Color.fromARGB(100, 255, 255, 255)),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Enter your name'),
                                onChanged: (value) {
                                  name = value;
                                }))))),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        180, 255, 255, 255),
                                    width: 1),
                                color:
                                    const Color.fromARGB(100, 255, 255, 255)),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Enter your password'),
                                onChanged: (value) {
                                  password = value;
                                }))))),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        180, 255, 255, 255),
                                    width: 1),
                                color:
                                    const Color.fromARGB(100, 255, 255, 255)),
                            child: IconButton(
                                onPressed: () async => {
                                      notifier.switchUser(
                                          await logInUser(name, password))
                                    },
                                icon: const Icon(Icons.login))))))
          ],
        ),
      );
    });
  }
}

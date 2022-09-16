import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/classes/itemClass.dart';
import 'package:second_flutter/Functions/GetRequest.dart';

import 'ChangeNotigier.dart';

class ToDo extends StatelessWidget {
  const ToDo({super.key});
  set tkn(tkn) {}
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsScreenNotifier>(
        builder: (context, notifier, child) {
      return Container(
          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: FutureBuilder(
              future: getRequest(tkn = notifier.currentUSer),
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
              }));
    });
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
                                  ))),
                          Expanded(
                              child: Text(
                            widget.item.discription,
                            style: const TextStyle(fontSize: 20),
                          ))
                        ])))));
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:mydictionary/provider/json_provider.dart';

import 'package:mydictionary/screens/searched_word_detail_screen.dart';

class RandomWordScreen extends StatefulWidget {
  static const routeName = '/search';
  const RandomWordScreen({Key? key}) : super(key: key);

  @override
  State<RandomWordScreen> createState() => _RandomWordScreenState();
}

class _RandomWordScreenState extends State<RandomWordScreen> {
  late Future _dictData;
  // var isPressed = false;
  // var pressedItem = Words();

  @override
  void initState() {
    _dictData = loadDictData();
    super.initState();
  }

  // void _addWord(var data, int index) {
  //   if (isPressed) {
  //     setState(() {});
  //   }
  // }

  // void _toggleSaved() {
  //   setState(() {
  //     isPressed != isPressed;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dictData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        Map<String, dynamic> dictData = json.decode(snapshot.data.toString());
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: ListView.builder(
                itemCount: dictData.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        child: Card(
                          color: Theme.of(context).primaryColor,
                          // margin: const EdgeInsets.all(10),
                          child: Container(
                            height: 80,
                            color: Theme.of(context).colorScheme.secondary,
                            child: ListTile(
                              isThreeLine: true,
                              // leading: IconButton(
                              //   icon: isPressed
                              //       ? const Icon(Icons.star)
                              //       : const Icon(Icons.star_border),
                              //   onPressed: () {
                              //     // pressedItem.wordMap.putIfAbsent(
                              //     //     dictData.keys.elementAt(index).toString(),
                              //     //     () => dictData.values
                              //     //         .elementAt(index)
                              //     //         .toString());
                              //     // _addWord(dictData, index);
                              //     // _toggleSaved;
                              //     setState(() {
                              //       isPressed = !isPressed;
                              //     });
                              //   },
                              // ),
                              title: Text(
                                dictData.keys.elementAt(index).toString(),
                              ),
                              // subtitle: Text(_items[index]["description"]),
                              subtitle: Text(
                                  dictData.values.elementAt(index).toString()),
                              onTap: () => Navigator.of(context).pushNamed(
                                  SearchedWordsScreen.routeName,
                                  arguments: [
                                    dictData.values.elementAt(index).toString(),
                                    dictData.keys.elementAt(index).toString()
                                  ]),
                            ),
                          ),
                        ),
                      ));
                }));
      },
    );
  }
}

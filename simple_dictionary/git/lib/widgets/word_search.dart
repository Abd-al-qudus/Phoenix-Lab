import 'package:flutter/material.dart';
import 'package:mydictionary/provider/json_provider.dart';
import 'package:mydictionary/screens/searched_word_detail_screen.dart';
import 'dart:convert';

class WordSearch extends StatefulWidget {
  const WordSearch({Key? key}) : super(key: key);

  @override
  State<WordSearch> createState() => _WordSearchState();
}

class _WordSearchState extends State<WordSearch> {
  TextEditingController searchedText = TextEditingController();
  late List<Map<String, dynamic>> newMap;
  late Future wordMap;
  List<Map<String, dynamic>> searchMap = [];

  void search(String word) {
    List<Map<String, dynamic>> searchResult = [];
    if (word.isEmpty) {
      searchResult = newMap;
    } else {
      searchResult = newMap
          .where(
            (value) => value.keys.contains(
              word.toLowerCase(),
            ),
          )
          .toList();
    }
    setState(() {
      searchMap = searchResult;
    });
  }

  @override
  void initState() {
    wordMap = loadDictData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: wordMap,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          newMap = [json.decode(snapshot.data.toString())];
          return Column(
            children: [
              Card(
                color: Theme.of(context).colorScheme.secondary,
                child: TextFormField(
                  controller: searchedText,
                  decoration: const InputDecoration(
                    hintText: 'search',
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                  onChanged: (value) {
                    search(value);
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
              ),
              if (searchMap.isEmpty) Container(),
              if (searchMap.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: SizedBox(
                    height: 0.55 * screenHeight,
                    child: Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: ListView.builder(
                        itemBuilder: (ctx, index) => ListTile(
                          title: Text(searchedText.text),
                          subtitle: searchMap[index][searchedText.text] != null
                              ? Text(
                                  '${searchMap[index][searchedText.text]}',
                                )
                              : const Text('Enter your word'),
                          onTap: () => Navigator.of(context).pushNamed(
                              SearchedWordsScreen.routeName,
                              arguments: [
                                searchMap[index][searchedText.text],
                                searchedText.text
                              ]),
                        ),
                        itemCount: searchMap.length,
                      ),
                    ),
                  ),
                ),
            ],
          );
        });
  }
}

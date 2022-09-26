import 'package:flutter/material.dart';

class SearchedWordsScreen extends StatefulWidget {
  static const routeName = '/search-details';

  @override
  State<SearchedWordsScreen> createState() => _SearchedWordsScreenState();
}

class _SearchedWordsScreenState extends State<SearchedWordsScreen> {
  var isPressed = false;
  var dataList;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      dataList = data as List;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dataList[1],
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontFamily: 'Ubuntu',
            fontSize: 20,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  dataList[0],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontFamily: 'Ubuntu',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}

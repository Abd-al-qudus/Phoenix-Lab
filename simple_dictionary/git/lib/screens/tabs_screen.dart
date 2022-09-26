import 'package:flutter/material.dart';

import 'random_word_screen.dart';
import 'search_word_screen.dart';

class TabScreen extends StatefulWidget {
  static const routeName = 'tabscreens';
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text(
              'Phoenix Dictionary',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 20,
                wordSpacing: 1.2,
              ),
            ),
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              ),
              Tab(
                icon: Icon(Icons.book),
                text: 'Random Words',
              ),
              // Tab(
              //   icon: Icon(Icons.save),
              //   text: 'Saved',
              // ),
            ]),
          ),
          body: TabBarView(children: [
            SearchWord(),
            const RandomWordScreen(),
            // const SavedWordScreen(),
          ]),
        ));
  }
}

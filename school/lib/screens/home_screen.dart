import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import '../widgets/home_screen_builder.dart';
import '../widgets/test_screen_builder.dart';
import '../widgets/helpers.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final text = CustomTexts();
  final size = CustomSizes();
  final col = CustomColors();

  void onTapped(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  List<Widget> screens = const [
    HomeScreenBuilder(),
    TestScreenBuilder(),
  ];

  @override
  Widget build(BuildContext context) {
    final mSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: col.color3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(size.small - 3),
            bottomRight: Radius.circular(size.small - 3),
          ),
        ),
        title: Text(
          text.homeScreen,
          style: TextStyle(
            fontSize: size.medium,
            fontWeight: FontWeight.bold,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        actions: [
          PopupMenuButton(itemBuilder: (context) => []),
        ],
      ),
      drawer: SingleChildScrollView(
        child: SizedBox(
          width: mSize.width * 0.8,
          height: mSize.height,
          child: DrawerBody(
            size: size.small,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: col.color2,
        unselectedItemColor: col.color2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            label: "TEST",
          ),
        ],
        onTap: onTapped,
        currentIndex: selectedIndex,
      ),
      body: screens.elementAt(selectedIndex),
    );
  }
}

class DrawerBody extends StatelessWidget {
  final double size;
  DrawerBody({Key? key, required this.size}) : super(key: key);

  final col = CustomColors();
  Widget _buildText(String text) {
    return Padding(
      padding: EdgeInsets.all(size - 13),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildListViewElement(String title, String subtitle, void onTapped) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size - 5, vertical: size - 10),
      child: ListTile(
        tileColor: col.color2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size * 2),
        ),
        title: Center(
          child: Text(
            title,
            style: TextStyle(
              color: col.color1,
              fontSize: size + 3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Center(
          child: Text(
            subtitle,
            style: TextStyle(
              fontFamily: "PT_Sans",
              color: col.color1,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        onTap: () => onTapped,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final text = CustomTexts();
    return Drawer(
      width: width * 0.75,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(size),
          bottomRight: Radius.circular(size),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: size * 3,
                bottom: size,
              ),
              child: CircleAvatar(
                radius: size * 5,
              ),
            ),
          ),
          Center(
            child: _buildText(text.stdInfo),
          ),
          const Divider(
            thickness: 4,
          ),
          _buildText(text.stdName),
          _buildText(text.stdId),
          _buildText(text.department),
          _buildText(text.level),
          // _buildText(text.age),
          _buildText(text.contact),
          const Divider(
            thickness: 4,
          ),
          _buildListViewElement(
              "ACADEMICS", "check the academic's schedule", () {}),
          _buildListViewElement(
              "RESULTS", "check your examination results", () {}),
          _buildListViewElement("LOGOUT", ".............", () {}),
        ],
      ),
    );
  }
}

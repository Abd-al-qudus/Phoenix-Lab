import 'package:flutter/material.dart';
import '../screens/teacher_std_room.dart';
import '../screens/student_room.dart';
import '../widgets/helpers.dart';
import '../widgets/widget_card.dart';

class HomeScreenBuilder extends StatelessWidget {
  const HomeScreenBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = CustomSizes();
    final spacers = Spacers();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spacers.larSpacer,
            WidgetCard(
              onTapped: () =>
                  Navigator.of(context).pushNamed(TeacherStdRoom.routeName),
              text: "STUDENT ROOM",
              size: size.medium,
              height: size.medium * 6,
            ),
            const Divider(),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
              child: const Text(
                'recent activities',
                style: TextStyle(
                  fontFamily: 'PT_Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.95,
              height: height * 0.35,
              child: Card(
                elevation: 10,
                child: NewsBody(
                  height: height,
                  width: width,
                  onTapped: () {},
                ),
              ),
            ),
            SizedBox(
              width: width * 0.95,
              height: height * 0.35,
              child: Card(
                elevation: 10,
                child: NewsBody(
                  height: height,
                  width: width,
                  onTapped: () {},
                ),
              ),
            ),
            SizedBox(
              width: width * 0.95,
              height: height * 0.35,
              child: Card(
                elevation: 10,
                child: NewsBody(
                  height: height,
                  width: width,
                  onTapped: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsBody extends StatelessWidget {
  final double height;
  final double width;
  final void onTapped;
  const NewsBody({
    Key? key,
    required this.height,
    required this.width,
    required this.onTapped,
  }) : super(key: key);

  Widget _buildText(String text, double size, {Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.white70,
        fontFamily: 'PT_Sans',
      ),
      maxLines: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapped,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GridTile(
            footer: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              isThreeLine: true,
              tileColor: Colors.black54,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildText('Title: ', 12),
                  _buildText('Author: ', 12),
                ],
              ),
              subtitle: Column(
                children: [
                  _buildText(
                      'This is a test case obtained at star labs, there are variations in standard parameters and it defys gravity but i have to process this and discuss the outcome. Can i make a standard assumption? an european physicist laments!!!, gotta keep quiet bro',
                      10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildText('Date: ', 9),
                      _buildText('Time: ', 9),
                    ],
                  ),
                ],
              ),
            ),
            child: const Center(
              child: Text('HELLO'),
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_horiz),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: _buildText('SAVE', 10, color: Colors.black),
              ),
              PopupMenuItem(
                child: _buildText('DELETE', 10, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

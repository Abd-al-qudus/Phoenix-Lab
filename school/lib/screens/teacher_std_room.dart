import 'package:flutter/material.dart';
import 'package:school/widgets/widget_card.dart';
import '../widgets/helpers.dart';

class TeacherStdRoom extends StatelessWidget {
  static const routeName = '/teacher-std-room';
  const TeacherStdRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = CustomTexts();
    final size = CustomSizes();
    final spacers = Spacers();
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          text.studentRoom,
          style: TextStyle(
            fontSize: size.medium,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(padding: EdgeInsets.all(size.small), children: [
        WidgetCard(
          onTapped: () {},
          text: text.stdRecord,
          size: size.medium,
          height: height * 0.2,
        ),
        spacers.medSpacer,
        WidgetCard(
          onTapped: () {},
          text: text.quiz,
          size: size.medium,
          height: height * 0.2,
        ),
        spacers.medSpacer,
        WidgetCard(
          onTapped: () {},
          text: text.uploadRst,
          size: size.medium,
          height: height * 0.2,
        ),
        spacers.medSpacer,
        WidgetCard(
          onTapped: () {},
          text: text.studentRoom,
          size: size.medium,
          height: height * 0.2,
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import '../screens/quiz_performance.dart';
import '../widgets/helpers.dart';
import '../widgets/widget_card.dart';

class StudentPerformance extends StatelessWidget {
  static const routeName = '/std-performance';
  const StudentPerformance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spacers = Spacers();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'PERFORMANCE',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Center(
          child: CircleAvatar(
            radius: 70,
          ),
        ),
        spacers.medSpacer,
        const Text('>>>>>>>>>>>>>>>>>>>>>>'),
        const Divider(),
        WidgetCard(
            onTapped: () => Navigator.of(context).pushNamed(
                  QuizPerformance.routeName,
                ),
            text: 'QUIZ PERFORMANCE',
            size: 20,
            height: 100),
        spacers.medSpacer,
        WidgetCard(
            onTapped: () {},
            text: 'OVERALL PERFORMANCE',
            size: 20,
            height: 100),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:school/models/quiz_model.dart';

class QuizPerformance extends StatelessWidget {
  static const routeName = '/q-performance';
  const QuizPerformance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'QUIZ PERFORMANCE',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {},
            child: CustomListElement(
              qModel: QuizModel(
                course: "ABE 263",
                title: "EVALUATION 001",
                id: "me",
                timeAllowed: "40",
                dateTime: DateTime.now(),
              ),
            ),
          ),
          CustomListElement(
            qModel: QuizModel(
              course: "ABE 263",
              title: "EVALUATION 002",
              id: "me",
              timeAllowed: "40",
              dateTime: DateTime.now(),
            ),
          ),
          CustomListElement(
            qModel: QuizModel(
              course: "ABE 263",
              title: "EVALUATION 003",
              id: "me",
              timeAllowed: "40",
              dateTime: DateTime.now(),
            ),
          ),
          CustomListElement(
            qModel: QuizModel(
              course: "ABE 263",
              title: "EVALUATION 004",
              id: "me",
              timeAllowed: "40",
              dateTime: DateTime.now(),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListElement extends StatefulWidget {
  final QuizModel qModel;
  const CustomListElement({Key? key, required this.qModel}) : super(key: key);

  @override
  State<CustomListElement> createState() => _CustomListElementState();
}

class _CustomListElementState extends State<CustomListElement> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: size.height * 0.12,
        width: size.width * 0.95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: SizedBox(
                width: size.width * 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        widget.qModel.title,
                        style: const TextStyle(
                            fontFamily: 'PT_Sans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      ">>> ${widget.qModel.course}",
                      style: const TextStyle(
                          fontFamily: 'PT_Sans',
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.qModel.dateTime.toString(),
                          style: const TextStyle(
                              fontFamily: 'PT_Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.qModel.timeAllowed} mins.",
                          style: const TextStyle(
                              fontFamily: 'PT_Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Icon(
              widget.qModel.isGraded ? Icons.check : Icons.close,
              color: widget.qModel.isGraded ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

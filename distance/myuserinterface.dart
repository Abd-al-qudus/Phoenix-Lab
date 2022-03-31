import 'package:flutter/material.dart';
import 'converterlogic.dart';

class MyUserInterface extends StatefulWidget {
  @override
  State<MyUserInterface> createState() => _MyUserInterfaceState();
}

class _MyUserInterfaceState extends State<MyUserInterface> {
  String? defaultValue = 'meter';
  String? newValue = 'meter';
  String valueInput = '0';
  late double answer;

  double solutionText = 0;

  void solution() {
    final int? getIndex = getInt[newValue];
    final double index = converter[defaultValue]![getIndex!];
    if (valueInput == '') {
      valueInput = '0';
    }
    answer = (index * double.tryParse(valueInput)!);

    setState(() {
      solutionText = answer;
    });
  }

  void nullReset() {
    setState(() {
      defaultValue = 'meter';
      newValue = 'meter';
      solutionText = 0;
    });
  }

  Widget buildButtons(String text, var handler) {
    return Expanded(
      child: RaisedButton(
        onPressed: handler,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              'value',
              style: TextStyle(fontSize: 20),
            )),
        TextField(
          keyboardType: TextInputType.number,
          textDirection: TextDirection.ltr,
          onChanged: (text) {
            setState(() {
              valueInput = text;
            });
          },
          decoration: const InputDecoration(labelText: 'distance'),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'from',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton<String>(
              items: selections.map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  defaultValue = value;
                });
              },
              isExpanded: true,
              value: defaultValue,
            )),
        const Text(
          'to',
          style: TextStyle(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButton<String>(
            items: selections.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              setState(() {
                newValue = value;
              });
            },
            isExpanded: true,
            value: newValue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              buildButtons('convert', solution),
              Container(
                width: 10,
              ),
              buildButtons('reset', nullReset)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          child: Text(
            solutionText == 0
                ? 'Enter value for conversion'
                : '$valueInput $defaultValue(s) =  ${solutionText.toStringAsFixed(2)} $newValue(s)',
            style: const TextStyle(fontSize: 20),
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import '../logic/bmi_logic.dart';

class BmiScreenBody extends StatefulWidget {
  @override
  State<BmiScreenBody> createState() => _BmiScreenBodyState();
}

class _BmiScreenBodyState extends State<BmiScreenBody> {
  final List<String> _items = [
    'Athletes',
    'Elders aged 65 and above',
    'Younger ones less than 18',
    'Pregnant women',
  ];
  final _massInput = TextEditingController();
  final _heightInput = TextEditingController();
  var bmiCalculator = BmiLogic();

  Widget _buildContainer(Widget child, double? height, double? width) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(left: 1, right: 1),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(3)),
      child: Center(
        child: child,
      ),
    );
  }

  Widget _buildColumnElements(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 40,
        ),
        Text(
          text,
          style: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor),
        )
      ],
    );
  }

  Widget _buildtext(String text, String description) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(child: Text(text)),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(child: Text(description)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).size;
    final deviceHeight = mediaQueryData.height;
    final deviceWidth = mediaQueryData.width;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildContainer(
            Text(
              'calculate your BMI',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            deviceHeight * 0.07,
            deviceWidth,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildContainer(_buildColumnElements(Icons.male, 'Male'),
                  deviceHeight * 0.12, deviceWidth * 0.45),
              _buildContainer(_buildColumnElements(Icons.female, 'Female'),
                  deviceHeight * 0.12, deviceWidth * 0.45),
            ],
          ),
          _buildContainer(
            Card(
              color: Theme.of(context).primaryColor,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: ' Mass (kg)',
                ),
                keyboardType: TextInputType.number,
                controller: _massInput,
              ),
            ),
            deviceHeight * 0.1,
            deviceWidth,
          ),
          _buildContainer(
            Card(
              color: Theme.of(context).primaryColor,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: ' Height (m)',
                ),
                keyboardType: TextInputType.number,
                controller: _heightInput,
              ),
            ),
            deviceHeight * 0.1,
            deviceWidth,
          ),
          _buildContainer(
            TextButton(
                onPressed: () {
                  if (_massInput.text != null &&
                      _heightInput.text != null &&
                      _massInput.text != '' &&
                      _heightInput.text != '' &&
                      _massInput.text != '0' &&
                      _heightInput.text != '0') {
                    final answer = bmiCalculator.calculateBmi(
                      double.parse(_massInput.text),
                      double.parse(_heightInput.text),
                    );
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: Theme.of(context).primaryColor,
                              // title: const Text(
                              //   'oops!!!',
                              //   style: TextStyle(fontSize: 20),
                              //   textAlign: TextAlign.center,
                              // ),
                              content: ListTile(
                                title: Text(
                                  answer,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: double.parse(answer) < 18.5
                                    ? const Text(
                                        'your bmi value is underweight',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : (18.5 < double.parse(answer) &&
                                            double.parse(answer) < 25.0)
                                        ? const Text(
                                            'your bmi value is healthy',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : const Text(
                                            'your bmi value is overweight',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                              ),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text(
                                      'okay',
                                      style: TextStyle(
                                        color: Theme.of(context).canvasColor,
                                      ),
                                    )),
                              ],
                            ));
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: Theme.of(context).primaryColor,
                              // title: const Text(
                              //   'oops!!!',
                              //   style: TextStyle(fontSize: 20),
                              //   textAlign: TextAlign.center,
                              // ),
                              content: const ListTile(
                                contentPadding: EdgeInsets.all(5),
                                title: Text(
                                  'oops!!!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  'please enter valid parameters',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text(
                                      'okay',
                                      style: TextStyle(
                                        color: Theme.of(context).canvasColor,
                                      ),
                                    )),
                              ],
                            ));
                  }
                },
                child: Text(
                  'calculate',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 1.3),
                )),
            deviceHeight * 0.1,
            deviceWidth,
          ),
          Card(
            child: SizedBox(
              child: Column(
                children: <Widget>[
                  const Center(
                    child: Text(
                      'notes',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 15,
                      ),
                    ),
                  ),
                  _buildtext('25.0 or more', 'overweight'),
                  _buildtext('18.5 - 24.9', 'healthy'),
                  _buildtext('less than 18.5', 'underweight'),
                  const Text(
                    'BMI values can be exclusive for',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Theme.of(context).primaryColor,
            child: SizedBox(
              height: deviceHeight * 0.15,
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundColor: Theme.of(context).canvasColor,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  title: Text(
                    _items[index],
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                itemCount: _items.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

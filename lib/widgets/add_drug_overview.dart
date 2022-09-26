import 'package:flutter/material.dart';
import '../models/drugs_provider.dart';
import '../models/http_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddDrugOverview extends StatelessWidget {
  final Map productDetails;
  AddDrugOverview({
    Key? key,
    required this.productDetails,
  }) : super(key: key);

  final httpRequests = HttpRequests();

  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController dosage = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController imageUrl = TextEditingController();
  bool status = true;

  final httpRequest = HttpRequests();
  Widget _textOverviewBuilder({
    required String labelText,
    required var controller,
    TextInputType keyboardInputType = TextInputType.name,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: labelText,
        ),
        controller: controller,
        keyboardType: keyboardInputType,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final addDrug = Provider.of<DrugsModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Column(
          children: <Widget>[
            _textOverviewBuilder(
              labelText: 'Name',
              controller: name,
            ), //price
            _textOverviewBuilder(
              labelText: 'Price',
              keyboardInputType: TextInputType.number,
              controller: price,
            ), //status
            _textOverviewBuilder(
              labelText: 'Dosage',
              controller: dosage,
            ), //name
            _textOverviewBuilder(
              labelText: 'Description',
              controller: description,
            ), //dosage //description
            _textOverviewBuilder(
              labelText: 'Image Link',
              keyboardInputType: TextInputType.url,
              controller: imageUrl,
            ), //imageUrl
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    status = true;
                  },
                  child: const Text('available'),
                ),
                TextButton(
                  onPressed: () {
                    status = false;
                  },
                  child: const Text('out of stock'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: () async {
                  if (name.text.isNotEmpty &&
                      price.text.isNotEmpty &&
                      dosage.text.isNotEmpty &&
                      description.text.isNotEmpty &&
                      imageUrl.text.isNotEmpty) {
                    await httpRequest
                        .addProducts(
                            name.text,
                            price.text,
                            imageUrl.text,
                            description.text,
                            dosage.text,
                            status,
                            productDetails['category'])
                        .then((value) {
                      List addNewDrug;
                      if (productDetails['category'] == 'others') {
                        addNewDrug = addDrug.others;
                      } else if (productDetails['category'] == 'inhalational') {
                        addNewDrug = addDrug.inhalational;
                      } else if (productDetails['category'] == 'analgestic') {
                        addNewDrug = addDrug.analgestic;
                      } else if (productDetails['category'] == 'antidote') {
                        addNewDrug = addDrug.antidote;
                      } else if (productDetails['category'] == 'anti-leprosy') {
                        addNewDrug = addDrug.antiLeprosy;
                      } else if (productDetails['category'] ==
                          'anti-bacterial') {
                        addNewDrug = addDrug.antiBacterial;
                      } else if (productDetails['category'] ==
                          'antiepileptic') {
                        addNewDrug = addDrug.antiEpileptic;
                      } else if (productDetails['category'] ==
                          'anti-infectional') {
                        addNewDrug = addDrug.antiInfectional;
                      } else {
                        addNewDrug = addDrug.injectable;
                      }

                      addDrug.addNewDrug(
                        name.text,
                        dosage.text,
                        description.text,
                        status,
                        double.parse(price.text),
                        imageUrl.text,
                        addNewDrug,
                      );
                      Navigator.of(context).pop();
                    });
                  }
                  return;
                },
                child: const Text('SAVE'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

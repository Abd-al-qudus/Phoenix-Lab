import 'package:flutter/material.dart';
import '../models/drugs_provider.dart';
import '../models/http_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddDrugOverview extends StatefulWidget {
  final Map productDetails;
  const AddDrugOverview({
    Key? key,
    required this.productDetails,
  }) : super(key: key);

  @override
  State<AddDrugOverview> createState() => _AddDrugOverviewState();
}

class _AddDrugOverviewState extends State<AddDrugOverview> {
  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController dosage = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController imageUrl = TextEditingController();

  bool status = true;
  bool isLoading = false;

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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'field cannot be empty';
            }
            return null;
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final addDrug = Provider.of<DrugsModel>(context);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          await httpRequest
                              .addProducts(
                                  name.text,
                                  price.text,
                                  imageUrl.text,
                                  description.text,
                                  dosage.text,
                                  status,
                                  widget.productDetails['category'])
                              .then((response) {
                            List addNewDrug;
                            if (widget.productDetails['category'] == 'others') {
                              addNewDrug = addDrug.others;
                            } else if (widget.productDetails['category'] ==
                                'inhalational') {
                              addNewDrug = addDrug.inhalational;
                            } else if (widget.productDetails['category'] ==
                                'analgestic') {
                              addNewDrug = addDrug.analgestic;
                            } else if (widget.productDetails['category'] ==
                                'antidote') {
                              addNewDrug = addDrug.antidote;
                            } else if (widget.productDetails['category'] ==
                                'anti-leprosy') {
                              addNewDrug = addDrug.antiLeprosy;
                            } else if (widget.productDetails['category'] ==
                                'anti-bacterial') {
                              addNewDrug = addDrug.antiBacterial;
                            } else if (widget.productDetails['category'] ==
                                'antiepileptic') {
                              addNewDrug = addDrug.antiEpileptic;
                            } else if (widget.productDetails['category'] ==
                                'anti-infectional') {
                              addNewDrug = addDrug.antiInfectional;
                            } else {
                              addNewDrug = addDrug.injectable;
                            }
                            if (response != httpRequest.failureCode) {
                              addDrug.addNewDrug(
                                response,
                                name.text,
                                dosage.text,
                                description.text,
                                status,
                                double.parse(price.text),
                                imageUrl.text,
                                addNewDrug,
                              );
                              Navigator.of(context).pop(true);
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(response),
                                ),
                              );
                            }
                          });
                        }
                        return;
                      },
                      child: const Text('SAVE'),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

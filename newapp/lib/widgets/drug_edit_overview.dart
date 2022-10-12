import 'package:flutter/material.dart';
import 'package:newapp/models/drugs_provider.dart';
import 'package:provider/provider.dart';
import '../models/http_provider.dart';

class DrugEditProfile extends StatefulWidget {
  final Map productDetails;
  const DrugEditProfile({
    Key? key,
    required this.productDetails,
  }) : super(key: key);

  @override
  State<DrugEditProfile> createState() => _DrugEditProfileState();
}

class _DrugEditProfileState extends State<DrugEditProfile> {
  bool isLoading = false;
  bool status = true;
  final httpRequest = HttpRequests();

  late TextEditingController name;
  late TextEditingController price;
  late TextEditingController dosage;
  late TextEditingController description;
  late TextEditingController imageUrl;

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
  void initState() {
    name = TextEditingController(text: widget.productDetails['name']);
    price =
        TextEditingController(text: widget.productDetails['price'].toString());
    description =
        TextEditingController(text: widget.productDetails['description']);
    dosage = TextEditingController(text: widget.productDetails['dosage']);
    imageUrl = TextEditingController(text: widget.productDetails['imageUrl']);
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    price.dispose();
    description.dispose();
    dosage.dispose();
    imageUrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final drugProvider = Provider.of<DrugsModel>(context);
    return isLoading
        ? const Center(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SingleChildScrollView(
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
                ), //dosage
                //description
                _textOverviewBuilder(
                  labelText: 'Image Link',
                  keyboardInputType: TextInputType.url,
                  controller: imageUrl,
                ), //imageUrl
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text('Status'),
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
                      // httpRequest.editProducts(
                      //     widget.productDetails['name'],
                      //     widget.productDetails['price'],
                      //     widget.productDetails['imageUrl'],
                      //     widget.productDetails['description'],
                      //     widget.productDetails['dosage'],
                      //     status,
                      //     widget.productDetails['categoryName'],
                      //     widget.productDetails['id']);
                      if (name.text.isNotEmpty &&
                          price.text.isNotEmpty &&
                          imageUrl.text.isNotEmpty &&
                          description.text.isNotEmpty &&
                          dosage.text.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                        await httpRequest
                            .editProducts(
                          name.text,
                          price.text,
                          imageUrl.text,
                          description.text,
                          dosage.text,
                          status,
                          widget.productDetails['category'],
                          widget.productDetails['id'],
                        )
                            .then((response) {
                          List addNewDrug = [];
                          if (widget.productDetails['category'] == 'others') {
                            addNewDrug = drugProvider.others;
                          } else if (widget.productDetails['category'] ==
                              'inhalational') {
                            addNewDrug = drugProvider.inhalational;
                          } else if (widget.productDetails['category'] ==
                              'analgestic') {
                            addNewDrug = drugProvider.analgestic;
                          } else if (widget.productDetails['category'] ==
                              'antidote') {
                            addNewDrug = drugProvider.antidote;
                          } else if (widget.productDetails['category'] ==
                              'anti-leprosy') {
                            addNewDrug = drugProvider.antiLeprosy;
                          } else if (widget.productDetails['category'] ==
                              'anti-bacterial') {
                            addNewDrug = drugProvider.antiBacterial;
                          } else if (widget.productDetails['category'] ==
                              'antiepileptic') {
                            addNewDrug = drugProvider.antiEpileptic;
                          } else if (widget.productDetails['category'] ==
                              'anti-infectional') {
                            addNewDrug = drugProvider.antiInfectional;
                          } else {
                            addNewDrug = drugProvider.injectable;
                          }
                          if (response == httpRequest.successCode) {
                            drugProvider.editDrugItem(
                                name: name.text,
                                price: double.parse(price.text),
                                imageUrl: imageUrl.text,
                                description: description.text,
                                dosage: dosage.text,
                                status: status,
                                id: widget.productDetails['id'],
                                category: addNewDrug);

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
                    },
                    child: const Text('SAVE'),
                  ),
                ),
              ],
            ),
          );
  }
}

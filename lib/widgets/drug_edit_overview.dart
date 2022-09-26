import 'package:flutter/material.dart';
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
  final httpRequests = HttpRequests();
  late TextEditingController name;
  late TextEditingController price;
  late TextEditingController dosage;
  late TextEditingController description;
  late TextEditingController imageUrl;

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
                    widget.productDetails['status'] = true;
                  },
                  child: const Text('available'),
                ),
                TextButton(
                  onPressed: () {
                    widget.productDetails['status'] = false;
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
                      dosage.text.isNotEmpty &&
                      description.text.isNotEmpty &&
                      imageUrl.text.isNotEmpty) {
                    await httpRequest
                        .editProducts(
                          name.text,
                          price.text,
                          imageUrl.text,
                          description.text,
                          dosage.text,
                          widget.productDetails['status'],
                          widget.productDetails['category'],
                          widget.productDetails['id'],
                        )
                        .then((value) => Navigator.of(context).pop());
                  }
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

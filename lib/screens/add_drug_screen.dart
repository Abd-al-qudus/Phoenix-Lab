import 'package:flutter/material.dart';
import '../widgets/add_drug_overview.dart';

class AddDrugScreen extends StatelessWidget {
  static const routeName = 'add-drug';
  const AddDrugScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetails = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADD DRUG',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: AddDrugOverview(productDetails: productDetails),
    );
  }
}

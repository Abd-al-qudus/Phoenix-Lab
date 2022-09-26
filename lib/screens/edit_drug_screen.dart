import 'package:flutter/material.dart';
import '../widgets/drug_edit_overview.dart';

class EditDrugScreen extends StatelessWidget {
  static const routeName = 'add-drug-screen';
  const EditDrugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetail = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EDIT DRUG',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: DrugEditProfile(
        productDetails: productDetail,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '/models/drugs_provider.dart';
import '/widgets/build_drug_categories_screen.dart';
import 'package:provider/provider.dart';

class AntidoteScreen extends StatelessWidget {
  static const routeName = 'antidote';
  const AntidoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final antidote = Provider.of<DrugsModel>(context).antidote;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ANTIDOTE',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BuildDrugCategories(
        buildItems: antidote,
        category: 'antidote',
      ),
    );
  }
}

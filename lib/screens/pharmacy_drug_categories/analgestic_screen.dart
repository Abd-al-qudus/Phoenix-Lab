import 'package:flutter/material.dart';
import '/models/drugs_provider.dart';
import '/widgets/build_drug_categories_screen.dart';
import 'package:provider/provider.dart';

class AnalgesticScreen extends StatelessWidget {
  static const routeName = 'analgestic';
  const AnalgesticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final analgestic = Provider.of<DrugsModel>(context).analgestic;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ANALGESTICS',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BuildDrugCategories(
        buildItems: analgestic,
        category: 'analgestic',
      ),
    );
  }
}

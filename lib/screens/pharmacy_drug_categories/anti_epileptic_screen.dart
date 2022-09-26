import 'package:flutter/material.dart';
import '/models/drugs_provider.dart';
import '/widgets/build_drug_categories_screen.dart';
import 'package:provider/provider.dart';

class AntiEpilepticScreen extends StatelessWidget {
  static const routeName = 'anti-epileptic';
  const AntiEpilepticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final antiEpileptic = Provider.of<DrugsModel>(context).antiEpileptic;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ANTI EPILEPTIC',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BuildDrugCategories(
        buildItems: antiEpileptic,
        category: 'antiepileptic',
      ),
    );
  }
}

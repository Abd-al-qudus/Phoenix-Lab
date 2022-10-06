import 'package:flutter/material.dart';
import '/models/drugs_provider.dart';
import '/widgets/build_drug_categories_screen.dart';
import 'package:provider/provider.dart';

class InhalationalScreen extends StatelessWidget {
  static const routeName = 'inhalational';
  const InhalationalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inhalational = Provider.of<DrugsModel>(context).inhalational;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'INHALATIONAL',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BuildDrugCategories(
        buildItems: inhalational,
        category: 'inhalational',
      ),
    );
  }
}

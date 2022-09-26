import 'package:flutter/material.dart';
import '/models/drugs_provider.dart';
import '/widgets/build_drug_categories_screen.dart';
import 'package:provider/provider.dart';

class InjectableScreen extends StatelessWidget {
  static const routeName = 'injectable';
  const InjectableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final injectable = Provider.of<DrugsModel>(context).injectable;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'INJECTABLE',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BuildDrugCategories(
        buildItems: injectable,
        category: 'injectable',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '/models/drugs_provider.dart';
import '/widgets/build_drug_categories_screen.dart';
import 'package:provider/provider.dart';

class AntiInfectionalScreen extends StatelessWidget {
  static const routeName = 'anti-infectional';
  const AntiInfectionalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final antiInfectional = Provider.of<DrugsModel>(context).antiInfectional;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ANTI INFECTIONAL',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BuildDrugCategories(
        buildItems: antiInfectional,
        category: 'anti-infectional',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '/models/drugs_provider.dart';
import '/widgets/build_drug_categories_screen.dart';
import 'package:provider/provider.dart';

class AntiBacterialScreen extends StatelessWidget {
  static const routeName = 'anti-bacterial';
  const AntiBacterialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final antiBacterial = Provider.of<DrugsModel>(context).antiBacterial;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ANTI BACTERIAL',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BuildDrugCategories(
        buildItems: antiBacterial,
        category: 'anti-bacterial',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '/models/drugs_provider.dart';
import '/widgets/build_drug_categories_screen.dart';
import 'package:provider/provider.dart';

class AntiLeprosyScreen extends StatelessWidget {
  static const routeName = 'anti-leprosy';
  const AntiLeprosyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final antiLeprosy = Provider.of<DrugsModel>(context).antiLeprosy;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ANTI LEPROSY',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BuildDrugCategories(
        buildItems: antiLeprosy,
        category: 'anti-leprosy',
      ),
    );
  }
}

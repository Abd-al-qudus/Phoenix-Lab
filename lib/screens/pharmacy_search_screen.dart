import 'package:flutter/material.dart';
import '../screens/pharmacy_drug_detail_screen.dart';

class PharmacySearchScreen extends StatelessWidget {
  static const routeName = 'search-screen';
  const PharmacySearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchResult = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
          foregroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            'SEARCH',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              fontSize: 25,
            ),
          ),
        ),
        body: searchResult.isNotEmpty
            ? ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) => ListTile(
                      onTap: () => Navigator.of(context).pushReplacementNamed(
                          DrugOverviewScreen.routeName,
                          arguments: {
                            'id': searchResult[index].id,
                            'name': searchResult[index].name,
                            'price': searchResult[index].price,
                            'description': searchResult[index].description,
                            'dosage': searchResult[index].dosage,
                            'imageUrl': searchResult[index].imageUrl,
                          }),
                      title: Text(searchResult[index].name),
                      subtitle: Text(searchResult[index].description),
                      leading: CircleAvatar(
                        child: FittedBox(
                          child: Text('${searchResult[index].price}'),
                        ),
                      ),
                    ))
            : const Center(
                child: Text('not found'),
              ));
  }
}

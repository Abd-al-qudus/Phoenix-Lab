import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/http_provider.dart';
import '../models/purchase_list_provider.dart';
import '../widgets/pharmacy_drug_detail_builder.dart';

class DrugOverviewScreen extends StatelessWidget {
  static const routeName = 'drug-details';
  const DrugOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final httpRequest = HttpRequests();
    final Map<dynamic, dynamic> detailMap =
        ModalRoute.of(context)!.settings.arguments as Map;
    final drugProvider = Provider.of<PurchaseDrugList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          detailMap['name'].toString().toUpperCase(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: detailMap['status']
            ? () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Center(child: Text('confirm action')),
                    content: const Text(
                        'do you want to add this item to your purchase list?'),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await httpRequest
                              .uploadCartItem(
                            detailMap['name'].toString(),
                            double.parse(detailMap['price']),
                            1,
                            detailMap['id'].toString(),
                          )
                              .then((value) {
                            drugProvider.addPurchaseItem(
                              detailMap['id'].toString(),
                              detailMap['name'].toString(),
                              double.parse(detailMap['price']),
                            );
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 1),
                                content: const Text('item added'),
                                action: SnackBarAction(
                                    label: 'undo',
                                    onPressed: () async {
                                      httpRequest
                                          .reduceCartItem(
                                        detailMap['id'].toString(),
                                        detailMap['name'].toString(),
                                      )
                                          .then((_) {
                                        drugProvider.reducePurchaseItem(
                                          detailMap['id'].toString(),
                                        );
                                      });
                                    }),
                              ),
                            );
                          });
                        },
                        child: const Text('ok'),
                      )
                    ],
                    actionsAlignment: MainAxisAlignment.end,
                  ),
                )
            : () {},
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: PharmacyDrugDetailsBuilder(
          details: detailMap,
        ),
      ),
    );
  }
}

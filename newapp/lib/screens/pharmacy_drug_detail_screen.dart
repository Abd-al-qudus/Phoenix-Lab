import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/http_provider.dart';
import '../models/purchase_list_provider.dart';
import '../widgets/pharmacy_drug_detail_builder.dart';

class DrugOverviewScreen extends StatefulWidget {
  static const routeName = 'drug-details';
  const DrugOverviewScreen({Key? key}) : super(key: key);

  @override
  State<DrugOverviewScreen> createState() => _DrugOverviewScreenState();
}

class _DrugOverviewScreenState extends State<DrugOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    final httpRequest = HttpRequests();
    final Map<dynamic, dynamic> detailMap =
        ModalRoute.of(context)!.settings.arguments as Map;
    final drugProvider = Provider.of<PurchaseDrugList>(context);
    return StatefulBuilder(
      builder: (context, setState) => isLoading
          ? Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
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
                    ? () async {
                        setState(() {
                          isLoading = true;
                        });
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

                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text('item added'),
                            // action: SnackBarAction(
                            //     label: 'undo',
                            //     onPressed: () async {
                            //       setState(() {
                            //         isLoading = true;
                            //       });
                            //       httpRequest
                            //           .reduceCartItem(
                            //         detailMap['id'].toString(),
                            //         detailMap['name'].toString(),
                            //       )
                            //           .then((_) {
                            //         drugProvider.reducePurchaseItem(
                            //           detailMap['id'].toString(),
                            //         );
                            //         setState(() {
                            //           isLoading = false;
                            //         });
                            //       });
                            //     }),
                          ));
                        });
                      }
                    : () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('oops'),
                            content: const Text('item not available'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('okay'),
                              ),
                            ],
                          ),
                        ),
                child: const Icon(Icons.add),
              ),
              body: SingleChildScrollView(
                child: PharmacyDrugDetailsBuilder(
                  details: detailMap,
                ),
              ),
            ),
    );
  }
}

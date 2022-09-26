import 'package:flutter/material.dart';
import '../models/http_provider.dart';
import '../models/purchase_list_provider.dart';
import 'package:provider/provider.dart';

class PurchaseListScreen extends StatefulWidget {
  static const routeName = 'purchase-list';
  const PurchaseListScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseListScreen> createState() => _PurchaseListScreenState();
}

class _PurchaseListScreenState extends State<PurchaseListScreen> {
  final httpRequest = HttpRequests();
  // ignore: prefer_typing_uninitialized_variables
  var purchaseDrugList;
  Widget _buildPurchaseOverview(
      String name, double price, String count, VoidCallback onPressed) {
    return Card(
      child: ListTile(
        onLongPress: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('confirm action'),
            content: Text('remove $name x1'),
            actions: [
              TextButton(
                onPressed: onPressed,
                child: const Text('okay'),
              ),
            ],
          ),
        ),
        leading: CircleAvatar(
          radius: 30,
          child: FittedBox(
            child: Text(
              'N${price.toString()}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'quantity: x$count',
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: SizedBox(
          height: 20,
          width: 25,
          child: FittedBox(
            child: Text('${int.parse(count) * price}'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final httpRequests = HttpRequests();
    double grandTotal = 0;
    final drugProvider = Provider.of<PurchaseDrugList>(context);
    final purchaseDrugList = drugProvider.purchaseItemList;
    final priceList = purchaseDrugList.map((e) => e.price * e.count).toList();
    for (var element in priceList) {
      grandTotal += element;
    }
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text(
          'PURCHASE LIST',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.shopping_cart,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: 120,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(120),
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  'N$grandTotal',
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    alignment: Alignment.centerRight,
                    child: const Icon(Icons.delete),
                  ),
                  key: Key(purchaseDrugList[index].name),
                  child: _buildPurchaseOverview(
                    purchaseDrugList[index].name,
                    purchaseDrugList[index].price,
                    purchaseDrugList[index].count.toString(),
                    () async {
                      final String name = purchaseDrugList[index].name;
                      final String id = purchaseDrugList[index].id;
                      final double price = purchaseDrugList[index].price;
                      await httpRequest
                          .reduceCartItem(
                        purchaseDrugList[index].id,
                        purchaseDrugList[index].name,
                      )
                          .then((value) {
                        drugProvider.reducePurchaseItem(
                          drugProvider.purchaseItemList[index].id,
                        );
                        Navigator.of(context).pop();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 1),
                            content: const Text('item removed'),
                            action: SnackBarAction(
                              label: 'undo',
                              onPressed: () async {
                                httpRequest
                                    .uploadCartItem(
                                      name,
                                      price,
                                      1,
                                      id,
                                    )
                                    .then(
                                      (_) => drugProvider.addPurchaseItem(
                                        id,
                                        name,
                                        price,
                                      ),
                                    );
                              },
                            ),
                          ),
                        );
                      });
                    },
                  ),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                        actionsAlignment: MainAxisAlignment.spaceBetween,
                        title: const Text('confirm action'),
                        content: Text(
                            'do you want to completely remove ${purchaseDrugList[index].name} x${purchaseDrugList[index].count}'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('back'),
                          ),
                          TextButton(
                            onPressed: () async {
                              await httpRequest
                                  .removeCartItem(
                                purchaseDrugList[index].name,
                                purchaseDrugList[index].id,
                              )
                                  .then((value) {
                                drugProvider.removeElement(
                                  purchaseDrugList[index].id,
                                );
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text('item removed'),
                                  ),
                                );
                              });
                            },
                            child: const Text('okay'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              itemCount: purchaseDrugList.length,
            ),
          ),
        ],
      ),
    );
  }
}

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
    String name,
    double price,
    int count,
    HttpRequests http,
    PurchaseDrugList drugList,
    String id,
  ) {
    return Card(
      child: ListTile(
        onLongPress: () => showDialog(
          context: context,
          builder: (context) => ShowDialogContentAlert(
            count: count,
            name: name,
            price: price,
            http: http,
            drugList: drugList,
            id: id,
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
            child: Text('${count * price}'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    purchaseDrugList[index].count,
                    httpRequest,
                    drugProvider,
                    purchaseDrugList[index].id,
                  ),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => SizedBox(
                        width: 200,
                        height: 100,
                        child: ShowDialogContent(
                          count: purchaseDrugList[index].count,
                          name: purchaseDrugList[index].name,
                          id: purchaseDrugList[index].id,
                          http: httpRequest,
                          drugList: drugProvider,
                        ),
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

class ShowDialogContent extends StatefulWidget {
  final String name;
  final String id;
  final int count;
  final PurchaseDrugList drugList;
  final HttpRequests http;

  const ShowDialogContent({
    Key? key,
    required this.http,
    required this.name,
    required this.drugList,
    required this.id,
    required this.count,
  }) : super(key: key);

  @override
  State<ShowDialogContent> createState() => _ShowDialogContentState();
}

class _ShowDialogContentState extends State<ShowDialogContent> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const AlertDialog(
            content: SizedBox(
              width: 200,
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceBetween,
            title: const Text('confirm action'),
            content: Text(
                'do you want to completely remove ${widget.name} x${widget.count}'),
            actions: [
                TextButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await widget.http
                        .removeCartItem(
                      widget.name,
                      widget.id,
                    )
                        .then((value) {
                      widget.drugList.removeElement(
                        widget.id,
                      );
                      setState(() {
                        isLoading = true;
                      });
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
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('back'),
                ),
              ]);
  }
}

class ShowDialogContentAlert extends StatefulWidget {
  final String name;
  final String id;
  final int count;
  final double price;
  final PurchaseDrugList drugList;
  final HttpRequests http;

  const ShowDialogContentAlert({
    Key? key,
    required this.http,
    required this.name,
    required this.drugList,
    required this.id,
    required this.count,
    required this.price,
  }) : super(key: key);

  @override
  State<ShowDialogContentAlert> createState() => _ShowDialogContentAlertState();
}

class _ShowDialogContentAlertState extends State<ShowDialogContentAlert> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const AlertDialog(
            content: SizedBox(
              width: 200,
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceAround,
            title: const Text('confirm action'),
            content: Text('remove ${widget.name} x1'),
            actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('back'),
                ),
                TextButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await widget.http
                        .reduceCartItem(
                      widget.id,
                      widget.name,
                    )
                        .then((value) {
                      widget.drugList.reducePurchaseItem(
                        widget.id,
                      );
                    }).then((value) {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content: const Text('item removed'),
                          action: SnackBarAction(
                            label: 'undo',
                            onPressed: () async {
                              widget.http
                                  .uploadCartItem(
                                    widget.name,
                                    widget.price,
                                    1,
                                    widget.id,
                                  )
                                  .then(
                                    (_) => widget.drugList.addPurchaseItem(
                                      widget.id,
                                      widget.name,
                                      widget.price,
                                    ),
                                  );
                            },
                          ),
                        ),
                      );
                    });
                  },
                  child: const Text('okay'),
                ),
              ]);
  }
}

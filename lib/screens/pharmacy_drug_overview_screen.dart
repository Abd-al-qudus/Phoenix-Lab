import 'package:flutter/material.dart';
import '../screens/payment_receipt_screen.dart';
import '../screens/purchase_list_screen.dart';
import '../widgets/pharmacy_drugs_overview_builder.dart';

class PharmacyDrugOverviewScreen extends StatelessWidget {
  static const routeName = 'pharmacy-drugs';
  const PharmacyDrugOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).canvasColor,
        // foregroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'PHARMACY',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontSize: 25,
          ),
        ),

        actions: [
          PopupMenuButton(
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(ctx).pushNamed(
                      PurchaseListScreen.routeName,
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 3,
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Theme.of(ctx).primaryColor,
                        ),
                      ),
                      const Text('purchase list'),
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(ctx).pushNamed(
                      PaymentReceiptScreen.routeName,
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 3,
                        ),
                        child: Icon(
                          Icons.payment,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const Text('payments'),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: PharmacyDrugOveriviewBuilder(),
      ),
    );
  }
}

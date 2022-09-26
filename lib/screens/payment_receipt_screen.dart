import 'package:flutter/material.dart';

class PaymentReceiptScreen extends StatelessWidget {
  static const routeName = 'payment-receipt';
  const PaymentReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RECEIPTS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('hey'),
      ),
    );
  }
}

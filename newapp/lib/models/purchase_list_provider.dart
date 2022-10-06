import 'package:flutter/cupertino.dart';
import 'package:newapp/models/http_provider.dart';
import 'package:newapp/models/purchase_model.dart';

class PurchaseDrugList with ChangeNotifier {
  final httpRequest = HttpRequests();
  var count = 1;
  final List<PurchaseModel> _purchaseItemList = [];

  List<PurchaseModel> get purchaseItemList {
    return [..._purchaseItemList];
  }

  void addPurchaseItem(
    String id,
    String name,
    double price,
  ) {
    final index = _purchaseItemList.indexWhere((element) => element.id == id);
    if (index != -1) {
      final addElement = purchaseItemList[index];
      _purchaseItemList.removeAt(index);
      _purchaseItemList.insert(
        index,
        PurchaseModel(
          name: addElement.name,
          price: addElement.price,
          id: id,
          count: addElement.count + 1,
        ),
      );
      notifyListeners();
    } else {
      _purchaseItemList.add(
        PurchaseModel(
          name: name,
          price: price,
          id: id,
        ),
      );
      notifyListeners();
    }
  }

  void reducePurchaseItem(String id) {
    final index = _purchaseItemList.indexWhere((element) => element.id == id);
    final removedElement = purchaseItemList[index];
    if (_purchaseItemList[index].count > 1) {
      _purchaseItemList.removeAt(index);
      _purchaseItemList.insert(
        index,
        PurchaseModel(
          name: removedElement.name,
          price: removedElement.price,
          id: removedElement.id,
          count: removedElement.count - 1,
        ),
      );
      notifyListeners();
    } else {
      _purchaseItemList.removeAt(index);
      notifyListeners();
    }
  }

  void removeElement(String id) {
    final index = _purchaseItemList.indexWhere((element) => element.id == id);
    _purchaseItemList.removeAt(index);
    notifyListeners();
  }
}

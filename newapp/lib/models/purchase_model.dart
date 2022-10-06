class PurchaseModel {
  final String name;
  final double price;
  final String id;
  final int count;

  const PurchaseModel({
    required this.name,
    required this.price,
    required this.id,
    this.count = 1,
  });
}

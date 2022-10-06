class Drugs {
  final double price;
  final bool status;
  final String id;
  final String name;
  final String dosage;
  final String description;
  final String imageUrl;

  Drugs({
    required this.name,
    required this.description,
    required this.dosage,
    required this.id,
    required this.price,
    this.status = true,
    required this.imageUrl,
  });
}

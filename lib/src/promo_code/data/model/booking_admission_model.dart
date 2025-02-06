class AdmissionItem {
  final String title;
  final int quantity;
  final double price;
  final DateTime? date;

  AdmissionItem({
    this.date,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Beneficiary {
  final int id;
  final String name;
  final String details;

  Beneficiary({required this.id, required this.name, required this.details});

  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(
      id: json['id'],
      name: json['name'],
      details: json['details'] ?? 'No details provided',
    );
  }
}

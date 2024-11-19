class Beneficiary {
  final String id;
  final String name;
  final String details;

  Beneficiary({
    required this.id,
    required this.name,
    required this.details,
  });

  // Factory constructor to create a Beneficiary object from JSON
  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(
      id: json['id'],
      name: json['name'],
      details: json['details'],
    );
  }

  // Method to convert a Beneficiary object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'details': details,
    };
  }
}

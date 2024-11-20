class Beneficiary {
  final int id;
  final String name;
  final int age;
  final String aadhaarNumber;
  final String mobileNumber;

  Beneficiary({
    required this.id,
    required this.name,
    required this.age,
    required this.aadhaarNumber,
    required this.mobileNumber,
  });

  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      aadhaarNumber: json['aadhaar_number'],
      mobileNumber: json['mobile_number'],
    );
  }
}
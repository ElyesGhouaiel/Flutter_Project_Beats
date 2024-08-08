// models/school_model.dart

//killian

class School {
  final String name;
  final String address;
  final String telephone;
  final double latitude; // Ajoutez latitude
  final double longitude; // Ajoutez longitude

  School(
      {required this.name,
      required this.address,
      required this.telephone,
      required this.latitude,
      required this.longitude});

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      name: json['nom'] ?? 'Unknown',
      address: json['adresse'] ?? 'Unknown',
      telephone: json['telephone'] ?? 'Unknown',
      latitude: json['latitude'] ?? 'Unknown',
      longitude: json['longitude'] ?? 'Unknown',
    );
  }
}

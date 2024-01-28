class ParkingGarage {
  final String image;
  final String name;
  final String address;
  final String pricePerHour;

  ParkingGarage({
    required this.image,
    required this.name,
    required this.address,
    required this.pricePerHour,
  });

  factory ParkingGarage.fromJson(Map<String, dynamic> json) {
    return ParkingGarage(
      image: json['image'],
      name: json['name'],
      address: json['address'],
      pricePerHour: json['pricePerHour'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'address': address,
      'pricePerHour': pricePerHour,
    };
  }
}

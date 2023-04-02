class GeoLocation {
  GeoLocation({
    required this.longitude,
    required this.latitude,
    // required this.pincode,
    required this.address,
    // required this.streetName,
  });

  late double longitude;
  late double latitude;
  late String pincode;
  late String address;
  // late String streetName;

  GeoLocation.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    // pincode = json['pincode'] ?? '';
    address = json['address'] ?? '';
    // streetName = json['street_name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    // data['pincode'] = pincode;
    data['address'] = address;
    // data['street_name'] = streetName;
    return data;
  }
}

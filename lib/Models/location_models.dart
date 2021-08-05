class LocationModels {
  final String lat;
  final String lng;

  LocationModels({
    this.lat,
    this.lng,
  });

  factory LocationModels.fromJosn(Map<String, dynamic> json) {
    return LocationModels(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

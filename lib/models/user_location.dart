class UserLocation{
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinates;
  final LocationTimeZone timezone;
  UserLocation({
    required this.city,
    required this.coordinates,
    required this.country,
    required this.postcode,
    required this.state,
    required this.street,
    required this.timezone,
});

  factory UserLocation.fromMap(Map<String,dynamic> json){
    final coordinates = LocationCoordinate.fomMap(json['coordinates']);
    final street = LocationStreet.fromMAp(json['street']);
    final timezone =LocationTimeZone.fromMap(json['timezone']);
     return UserLocation(
        city: json['city'],
        country: json['country'],
        postcode: json['postcode'].toString(),
        state:json['state'],
        coordinates: coordinates,
        street: street,
        timezone: timezone
    );
  }
}

class LocationStreet{
  final int number;
  final String name;
  LocationStreet({
    required this.number,
    required this.name
});

  factory LocationStreet.fromMAp(Map<String , dynamic> json){
    return LocationStreet(
      number: json['number'],
      name: json['name'],
    );
  }
}
 class LocationCoordinate {
  final String latitude;
  final String longitude;
  LocationCoordinate({
    required this.latitude,
    required this.longitude,
 });
  factory LocationCoordinate.fomMap(Map<String,dynamic>json){
    return LocationCoordinate(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
 }

 class LocationTimeZone{
  final String offset;
  final String description;
  LocationTimeZone({
    required this.offset,
    required this.description,
 });
  factory LocationTimeZone.fromMap(Map<String,dynamic> json){
    return LocationTimeZone(
        offset: json['offset'],
        description: json['description']
    );
  }
 }
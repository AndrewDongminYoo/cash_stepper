// 🌎 Project imports:
import 'lat_lng.dart';

class GetPlace {
  const GetPlace({
    this.latLng = const LatLng(0, 0),
    this.name = '',
    this.address = '',
    this.city = '',
    this.state = '',
    this.country = '',
    this.zipCode = '',
  });

  final LatLng latLng;
  final String name;
  final String address;
  final String city;
  final String state;
  final String country;
  final String zipCode;

  @override
  String toString() => '''
  GetPlace(
    latLng: $latLng,
    name: $name,
    address: $address,
    city: $city,
    state: $state,
    country: $country,
    zipCode: $zipCode,
  )''';
}

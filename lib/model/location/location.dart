import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tanvi/util/app_const.dart';
import 'dart:convert';
import './locationModel.dart';

class LocationProvider with ChangeNotifier {
  LocationProvider() {
    getLocation();
  }

  String baseUrl = AppConst.baseUrl;

  bool isLoading = true;

  bool get loading {
    return isLoading;
  }

  Map<String, dynamic> _coorDinates = {'lat': 0.0, 'lng': 0.0};
  Map<String, dynamic> _addressData = {};

  Map<String, dynamic> get addressData {
    return {..._addressData};
  }

  Map<String, dynamic> get coorDinates {
    return {..._coorDinates};
  }

  String _address = '';
  String _newAddressSet = '';
  String _deliveryAddress = '';
  String? _state = '';

  String? get state {
    return _state;
  }

  String get address {
    return _address;
  }

  String get newAddressSet {
    return _newAddressSet;
  }

  String get deliveryAddress {
    return _deliveryAddress;
  }

  String? postCode;
  String? addressLine;
  String? locality;
  String? city;
  String? selectedState;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getDefaultAddress() async {
    GetAddressFromLatLong;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    _address = '${place.subLocality}';
    _deliveryAddress =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    _state = place.administrativeArea;

    postCode = place.postalCode!;
    addressLine = '${place.street} ${place.thoroughfare}';
    locality = place.subLocality!;
    city = place.locality!;
    selectedState = place.administrativeArea!;

    print('Initial Address $postCode');
    print('Initial Address $addressLine');
    print('Initial Address $locality');
    print('Initial Address $city');
    print('Initial Address $selectedState');

    _coorDinates['lat'] = position.latitude;
    _coorDinates['lng'] = position.longitude;
    print('Delivery Address: $_deliveryAddress');
    print('Coordinates in Location ${_coorDinates['lat']}');
    print('Coordinates in Location ${_coorDinates['lng']}');
    // setState(() {});
    notifyListeners();
  }

  Future<void> setNewAddress(double latitude, double longitude) async {
    print('Baaaaaaaaaaaal Baaaaaaraaaaaa');
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    // _address = '${place.subLocality}';
    print('Aro Baaaaaaaaaaaal Baaaaaaraaaaaa');
    _deliveryAddress =
        '${place.street}, ${place.thoroughfare} ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.administrativeArea} ${place.country}';
    _newAddressSet =
        '${place.street}, ${place.thoroughfare} ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.administrativeArea} ${place.country}';
    postCode = place.postalCode!;
    addressLine = '${place.street} ${place.thoroughfare}';
    locality = place.subLocality!;
    city = place.locality!;
    selectedState = place.administrativeArea!;
    print('SET NEW ADDRESS');
    print('Initial Address $postCode');
    print('Initial Address $addressLine');
    print('Initial Address $locality');
    print('Initial Address $city');
    print('Initial Address $selectedState');
    print('New Address $_deliveryAddress');
    print('New Address Set $_newAddressSet');
    // setState(() {});
    _state = place.administrativeArea;
    _coorDinates['lat'] = latitude;
    _coorDinates['lng'] = longitude;
    notifyListeners();
  }

  Future<void> selectNewAddress(String id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url =
        Uri.parse(baseUrl + '/api/customer/shipping-address-update/$id/');
    // Uri.parse(baseUrl + '/api/customer/address/details/$id/');
    final response = await http.put(url,
        body: json.encode({
          // 'id': id,
          'is_default': true
        }),
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        });
    print(json.decode(response.body));
  }

  Future<void> editAddress(String? id, String name, String contactNumber,
      String houseDetails, String streetName) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url =
        Uri.parse(baseUrl + '/api/customer/shipping-address-update/$id/');
    final response = await http.put(url,
        body: json.encode({
          'id': id,
          'name': name,
          'contact_number': contactNumber,
          'postcode': postCode,
          'address_line': houseDetails == "" && streetName == ""
              ? addressLine
              : houseDetails == "" && streetName != ""
                  ? '$addressLine, Street Name: $streetName'
                  : streetName == "" && houseDetails != ""
                      ? '$addressLine, House Details: $houseDetails'
                      : '$addressLine, House Details: $houseDetails, Street Name: $streetName',
          'locality': locality == '' ? '.' : locality,
          'city': city,
          'state': state,
          // 'save_address_as': 'Home',
          'is_default': false,
          'map_lat': _coorDinates['lat'],
          'map_lng': _coorDinates['lng']
        }),
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        });

    print(json.decode(response.body));
  }

  Future<void> newAddress(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    _newAddressSet =
        '${place.street}, ${place.thoroughfare} ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.administrativeArea} ${place.country}';
    postCode = place.postalCode!;
    addressLine = '${place.street} ${place.thoroughfare}';
    locality = place.subLocality!;
    city = place.locality!;
    selectedState = place.administrativeArea!;
    print('NEW ADDRESS');
    print('Initial Address $postCode');
    print('Initial Address $addressLine');
    print('Initial Address $locality');
    print('Initial Address $city');
    print('Initial Address $selectedState');
    print('New Address $_deliveryAddress');
    print('New Address Set $_newAddressSet');
    // setState(() {});
    _state = place.administrativeArea;
    _coorDinates['lat'] = latitude;
    _coorDinates['lng'] = longitude;
    notifyListeners();
  }

  Future<void> setAddress(String name, String mobileNumber, String houseDetails,
      String streetName) async {
    var latitude = _coorDinates['lat'];
    var longitude = _coorDinates['lng'];

    print('Latitude Set Address $latitude');
    print('Longitude Set Address $longitude');

    print('HOUSE DETAILS: $houseDetails');
    print('STREET NAME: $streetName');

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + '/api/customer/shipping-address/');

    final response = await http.post(url,
        body: json.encode({
          'name': name,
          'contact_number': mobileNumber,
          'postcode': postCode,
          'address_line': houseDetails == "" && streetName == ""
              ? addressLine
              : houseDetails == "" && streetName != ""
                  ? '$addressLine, Street Name: $streetName'
                  : streetName == "" && houseDetails != ""
                      ? '$addressLine, House Details: $houseDetails'
                      : '$addressLine, House Details: $houseDetails, Street Name: $streetName', //Append House No,House/Apartment Name, Street Name to this
          'locality': locality,
          'city': city,
          'state': selectedState,
          'save_address_as': 'home',
          'is_default': true,
          'map_lat': latitude,
          'map_lng': longitude
        }),
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        });

    // print('Response Body ${json.decode(response.body)}');
  }

  Future<void> getAddress() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + '/api/customer/shipping-address/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    Address fetchedAddress = addressFromJson(response.body);
    // _addressData = json.decode(response.body);
    _addressData = fetchedAddress.toJson();
    print('Address Data Print $_addressData');
  }

  Future<void> getLocation() async {
    Position position = await _getGeoLocationPosition();
    GetAddressFromLatLong(position).then((_) {
      if (_address.length > 0) {
        isLoading = false;
      } else {
        isLoading = true;
      }
    });
    notifyListeners();
  }
}

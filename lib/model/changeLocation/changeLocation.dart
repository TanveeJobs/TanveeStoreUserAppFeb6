import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChangeLocationProvider with ChangeNotifier {
  String apiKey = 'AIzaSyBnEAzyBm_5qL13nn26_L0uH6b9g9VhKPA';
  List<dynamic> _places = [];

  List<dynamic> get places {
    return [..._places];
  }

  Future<void> findPlaceAutoCompleteSearch(String query) async {
    String urlAutocomplete =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$apiKey';
    final responseAutoComplete = await http.get(Uri.parse(urlAutocomplete));
    // print('Autocomplete Response ${responseAutoComplete.body}');
    final response = json.decode(responseAutoComplete.body);
    _places = response['predictions'];
    print(_places);
  }

  Future<Map<String, dynamic>> getLatLong(String placeId) async {
    String placeDetails =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey";
    final placeDetailsResponse = await http.get(Uri.parse(placeDetails));
    final response = json.decode(placeDetailsResponse.body);
    print('Address Response $response');
    return response;
  }
}

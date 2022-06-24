import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';

import 'package:http/http.dart' as http;

final GOOGLE_API_KEY = FlutterConfig.get('GOOGLE_API_KEY');

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double? latitude, required double? longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=hybrid&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY');
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}

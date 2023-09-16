import 'dart:convert';

import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl= 'https://restaurant-api.dicoding.dev/';
  static const String _listItem = 'list';
  static const String _getDetail = 'detail/';
  static const String _searchItem = 'search?q=';

  Future<RestaurantResult> listRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + _listItem));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant id');
    }
  }

  Future<DetailRestaurantResult> detailRestaurant(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + _getDetail + id));
    if (response.statusCode == 200) {
      return DetailRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }

  Future<SearchRestaurantResult> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + _searchItem + query));
    if (response.statusCode == 200) {
      return SearchRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant search');
    }
  }

}
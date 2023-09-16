import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/helper/result_state.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  SearchRestaurantProvider getSearchRestaurant(String query){
    _fetchSearchRestaurant(query);
    return this;
  }

  late SearchRestaurantResult _searchRestaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  SearchRestaurantResult get resultSearch => _searchRestaurantResult;
  ResultState get state => _state;

  Future<dynamic> _fetchSearchRestaurant(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.searchRestaurant(query);
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = "No Data Found";
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _searchRestaurantResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Error --> $e";
    }
  }
}
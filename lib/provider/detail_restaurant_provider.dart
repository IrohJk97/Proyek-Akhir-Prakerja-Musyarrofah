import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/helper/result_state.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  DetailRestaurantProvider getDetailRestaurant(String id) {
    _fecthDetailRestaurants(id);
    return this;
  }

  late DetailRestaurantResult _detailRestaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  DetailRestaurantResult get result => _detailRestaurantResult;
  ResultState get state => _state;

  Future<dynamic> _fecthDetailRestaurants(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final detailRestaurant = await apiService.detailRestaurant(id);
      if (!detailRestaurant.error) {
        _state = ResultState.hasData;
        notifyListeners();
        return _detailRestaurantResult = detailRestaurant;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = "No Data Found";
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
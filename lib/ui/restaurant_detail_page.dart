import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/helper/no_internet_connection.dart';
import 'package:restaurant_app/helper/result_state.dart';
import 'package:restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:restaurant_app/widgets/detail_screen.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailRestaurantProvider provider;
    return ChangeNotifierProvider(
      create: (_) {
        provider = DetailRestaurantProvider();
        return provider.getDetailRestaurant(restaurant.id);
      },
      child: Scaffold(
        body: Consumer<DetailRestaurantProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(
                  child: CircularProgressIndicator()
              );
            } else if (state.state == ResultState.hasData) {
              return detailScreenRestaurant(context, state.result.restaurant);
            } else if (state.state == ResultState.noData) {
              return Center(
                child: Text(state.message),
              );
            } else if (state.state == ResultState.error) {
              if (state.message.contains("SocketException")) {
                return const NoInternetConnection();
              } else {
                return Center(
                  child: Text(state.message),
                );
              }
            } else {
              return const Center(
                child: Text(
                  'No data to displayed',
                ),
              );
            }
          },
        )
      ),
    );
  }

  Widget detailScreenRestaurant(BuildContext context, DetailRestaurant detailRestaurant) => Material(
      child: DetailScreen(detailRestaurant: detailRestaurant),
    );

}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/helper/no_internet_connection.dart';
import 'package:restaurant_app/helper/result_state.dart';
import 'package:restaurant_app/provider/search_restaurant_provider.dart';
import 'package:restaurant_app/widgets/card_restaurant.dart';

class SearchRestaurantPage extends StatefulWidget {
  static const String searchTitle = 'Search Restaurant';
  const SearchRestaurantPage({Key? key}) : super(key: key);

  @override
  State<SearchRestaurantPage> createState() => _SearchRestaurantPageState();
}

class _SearchRestaurantPageState extends State<SearchRestaurantPage> {
  final _controller = TextEditingController(text: "");

  SearchRestaurantProvider provider = SearchRestaurantProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return provider.getSearchRestaurant(" ");
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SearchRestaurantPage.searchTitle),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        onSubmitted: (value) {
                          provider.getSearchRestaurant(_controller.text);
                        },
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          labelText: "Cari Makanan",
                          hintText: "Cari Makanan",
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<SearchRestaurantProvider>(
                  builder: (context, state, _) {
                    if (state.state == ResultState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.state == ResultState.hasData) {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.resultSearch.restaurants.length,
                          itemBuilder: (context, index) {
                            var restaurant = state.resultSearch.restaurants[index];
                            return CardRestaurant(restaurant: restaurant);
                          },
                        ),
                      );
                    } else if (state.state == ResultState.noData) {
                      return const Center(
                        child: Column(
                          children: [
                            Text('Data Restaurant Tidak Ditemukan'),
                          ],
                        ),
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
                      return const Center(child: Text(''));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void searchRestaurant(String query) {
    SearchRestaurantProvider provider;
    provider = SearchRestaurantProvider();
    provider.getSearchRestaurant(query);
  }
}
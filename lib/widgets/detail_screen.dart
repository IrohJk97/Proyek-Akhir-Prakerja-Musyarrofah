import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class DetailScreen extends StatelessWidget {
  final DetailRestaurant detailRestaurant;

  const DetailScreen({super.key, required this.detailRestaurant});

  Widget backgroundImage() {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: Hero(
        tag: detailRestaurant.pictureId,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("https://restaurant-api.dicoding.dev/images/large/${detailRestaurant.pictureId}"),
            ),
          ),
        ),
      ),
    );
  }

  Widget customShow() {
    return Container(
      width: double.infinity,
      height: 24,
      margin: const EdgeInsets.only(top: 235),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kWhiteColor.withOpacity(0),
            Colors.black.withOpacity(0.95),
          ],
        ),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 250),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            detailRestaurant.name,
                            style: whiteTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_city, color: Colors.white),
                          Text(
                            detailRestaurant.city,
                            style: whiteTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(
                        right: 2,
                      ),
                      child: const Icon(
                        Icons.star,
                        weight: 30,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      detailRestaurant.rating.toString(),
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  detailRestaurant.description,
                  style: blackTextStyle.copyWith(
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Foods',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: (MediaQuery.of(context).size.width * 0.94),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: detailRestaurant.menus!.foods.map((drinks) {
                      return SizedBox(
                        width: 120,
                        child: Card(
                          elevation: 2,
                          child: Center(
                            child: Text(
                              drinks.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Drinks',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: (MediaQuery.of(context).size.width * 0.94),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: detailRestaurant.menus!.drinks.map((food) {
                      return SizedBox(
                        width: 120,
                        child: Card(
                          elevation: 2,
                          child: Center(
                            child: Text(
                              food.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShow(),
            content(context),
          ],
        ),
      ),
    );
  }

}
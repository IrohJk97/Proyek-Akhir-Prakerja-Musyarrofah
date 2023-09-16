// Get List Item Restaurant
class RestaurantResult {
  bool error;
  String message;
  int count;
  List<Restaurant> restaurants;

  RestaurantResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants
  });

  factory RestaurantResult.fromJson(Map<String, dynamic> json) => RestaurantResult(
    error: json["error"],
    message: json["message"],
    count: json["count"],
    restaurants: List<Restaurant>.from((json["restaurants"] as List)
      .map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "count": count,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

// Detail Restaurant
class DetailRestaurantResult {
  bool error;
  String message;
  DetailRestaurant restaurant;

  DetailRestaurantResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory DetailRestaurantResult.fromJson(Map<String, dynamic> json) => DetailRestaurantResult(
    error: json["error"],
    message: json["message"],
    restaurant: DetailRestaurant.fromJson(json["restaurant"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "restaurant": restaurant,
  };
}

// Search Restaurant
class SearchRestaurantResult {
  bool error;
  int founded;
  List<Restaurant> restaurants;

  SearchRestaurantResult({
    required this.error,
    required this.founded,
    required this.restaurants
  });

  factory SearchRestaurantResult.fromJson(Map<String, dynamic> json) => SearchRestaurantResult(
      error: json["error"],
      founded: json["founded"],
      restaurants: List<Restaurant>.from((json["restaurants"] as List)
          .map((x) => Restaurant.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": founded,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

// Customer Review
class CustomerReview {
  String name;
  String review;
  String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
    name: json["name"],
    review: json["review"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "review": review,
    "date": date,
  };
}

class Menus {
  List<NameItem> foods;
  List<NameItem> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      foods: List<NameItem>.from(json['foods'].map((x) => NameItem.fromJson(x))),
      drinks: List<NameItem>.from(json['drinks'].map((x) => NameItem.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() =>{
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}

class NameItem {
  String name;

  NameItem({required this.name});

  factory NameItem.fromJson(Map<String, dynamic> drinks) {
    return NameItem(
        name: drinks['name']
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    pictureId: json['pictureId'],
    city: json['city'],
    rating: json['rating'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating
  };
}

class DetailRestaurant {
  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  double rating;
  Menus? menus;
  List<NameItem> categories;
  List<CustomerReview> customerReviews;

  DetailRestaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.rating,
    required this.menus,
    required this.categories,
    required this.customerReviews,
  });

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) => DetailRestaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    city: json["city"],
    address: json["address"],
    pictureId: json["pictureId"],
    rating: json["rating"].toDouble(),
    menus: Menus.fromJson(json["menus"]),
    categories: List<NameItem>.from((json["categories"] as List).map((x) => NameItem.fromJson(x))),
    customerReviews: List<CustomerReview>.from((json["customerReviews"] as List).map((x) => CustomerReview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "city": city,
    "address": address,
    "pictureId": pictureId,
    "rating": rating,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "menus": menus?.toJson(),
    "customerReviews": List<dynamic>.from(customerReviews.map((x) => x.toJson())),
  };
}

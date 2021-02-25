import 'package:flutter/foundation.dart';

class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.hotel,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}

FooditemList fooditemList = FooditemList
  (foodItems: [
  FoodItem(
    id: 1,
    title: "Food Food",
    hotel: "Detail Food",
    price: 11.99,
    imgUrl:'https://i.ytimg.com/vi/flCfaOMjnyo/maxresdefault.jpg',
  ),
  FoodItem(
    id: 2,
    title: "Food Food",
    hotel: "Dudleys",
    price: 11.99,
    imgUrl:
    "https://i.ytimg.com/vi/flCfaOMjnyo/maxresdefault.jpg",
  ),
  FoodItem(
    id: 3,
    title: "Food Food",
    hotel: "Detail Food",
    price: 11.99,
    imgUrl: "https://i.ytimg.com/vi/flCfaOMjnyo/maxresdefault.jpg",
  ),
  FoodItem(
    id: 4,
    title: "Food Food",
    hotel: "Detail Food",
    price: 11.99,
    imgUrl: "https://i.ytimg.com/vi/flCfaOMjnyo/maxresdefault.jpg",
  ),
  FoodItem(
    id: 5,
    title: "Food Food",
    hotel: "Detail Food",
    price: 11.99,
    imgUrl: "https://i.ytimg.com/vi/flCfaOMjnyo/maxresdefault.jpg",
  ),
  FoodItem(
    id: 6,
    title: "Food Food",
    hotel: "Detail Food",
    price: 11.99,
    imgUrl:
    "https://i.ytimg.com/vi/flCfaOMjnyo/maxresdefault.jpg",
  ),
]);
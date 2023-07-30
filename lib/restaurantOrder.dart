import 'package:restaurant/menuItem.dart';

class RestaurantOrder {
  String orderId;
  List<MenuItem> dishes;
  double? totalPrice;

  RestaurantOrder({required this.orderId, required this.dishes}) {
    totalPrice = calculateTotalPrice();
  }

  double calculateTotalPrice() {
    double total = 0;
    for (var dish in dishes) {
      total += dish.price;
    }
    return total;
  }
}
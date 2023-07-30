import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../restaurantOrder.dart';
class OrderManager {
  static const String _keyOrders = 'restaurant_orders';

  // Function to get the stored orders
  static Future<Map> getOrderFromStorage(String orderId) async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    Map json = jsonDecode(pref.getString(_keyOrders+orderId) ?? '');
    return json;

  }

  // Function to add an order to the stored list
  static Future<void> addOrderToStorage(RestaurantOrder order) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> orderToStore = {'orderId':order.orderId,'dishes':order.dishes,'totalPrice':order.totalPrice};
    prefs.setString(_keyOrders+order.orderId, jsonEncode(orderToStore));
  }

  // // Function to remove an order from the stored list
  // static Future<void> removeOrderFromStorage(String order) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final orders = prefs.getStringList(_keyOrders) ?? [];
  //   orders.remove(order);
  //   prefs.setStringList(_keyOrders, orders);
  // }
}
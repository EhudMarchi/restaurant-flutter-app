import '../menuItem.dart';
import '../menuItems.dart';
import '../restaurantOrder.dart';

RestaurantOrder createOrder(String id)
{
  // Create a new order
  RestaurantOrder order = RestaurantOrder(orderId: id, dishes: []);
  return order;
}

void addItemToOrder(MenuItem item,RestaurantOrder order)
{
  order.dishes.add(item);
  order.totalPrice = order.calculateTotalPrice();
}

void printOrder(RestaurantOrder order)
{
  // Print the details of the order
  print("Order ID: ${order.orderId}");
  for (var dish in order.dishes) {
    print("Dish: ${dish.name}, Price: \$${dish.price}");
  }
  print("Total Price: \$${order.totalPrice}");
}
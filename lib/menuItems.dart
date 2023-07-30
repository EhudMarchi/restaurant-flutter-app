import 'package:restaurant/menuItem.dart';
import 'package:restaurant/restaurantOrder.dart';

List<MenuItem> menuDishes = [
   MenuItem(name:"Margherita Pizza",
      details:"Classic pizza topped with tomato sauce, fresh mozzarella, and basil leaves.",
      price: 17,
      imageName: "pizza", updateOrder: (RestaurantOrder ) {  }, order: RestaurantOrder(orderId: '', dishes: []),),
   MenuItem(name:"Spaghetti",
      details:"Spaghetti tossed in a fresh tomato sauce with olives, black pepper and basil leaves.",
      price: 15.50,
      imageName: "pasta", updateOrder: (RestaurantOrder ) {  },order: RestaurantOrder(orderId: '', dishes: []),),
   MenuItem(name:"Italian Wedge Salad",
      details:"Iceberg lettuce, cherry tomatoes, red onions, Gorgonzola, and Italian dressing.",
      price: 8.50,
      imageName: "salad", updateOrder: (RestaurantOrder ) {  },order: RestaurantOrder(orderId: '', dishes: []),),
   MenuItem(name:"Tiramisu",
      details:"Layers of coffee-soaked ladyfingers and mascarpone cheese dusted with cocoa powder.",
      price: 11,
      imageName: "tiramisu", updateOrder: (RestaurantOrder ) {  },order: RestaurantOrder(orderId: '', dishes: []),),
   MenuItem(name:"Lemon Cake",
      details:"Traditional Italian fluffy lemon cake with fresh mint and powdered sugar on top.",
      price: 6.50,
      imageName: "lemon_cake", updateOrder: (RestaurantOrder ) {  },order: RestaurantOrder(orderId: '', dishes: []),),
];
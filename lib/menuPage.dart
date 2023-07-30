import 'package:flutter/material.dart';
import 'package:restaurant/orderSummaryPage.dart';
import 'package:restaurant/restaurantOrder.dart';

import 'menuItem.dart';
import 'menuItems.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late List<MenuItem> menuDishes;
  late RestaurantOrder currentOrder = RestaurantOrder(orderId: '123', dishes: []);
  void updateOrder(RestaurantOrder newOrder) {
    setState(() {
      currentOrder = newOrder;
    });
  }

  @override
  void initState() {
    menuDishes = [
      MenuItem(name:"Margherita Pizza",
        details:"Classic pizza topped with tomato sauce, fresh mozzarella, and basil leaves.",
        price: 17,
        imageName: "pizza", updateOrder: updateOrder, order: currentOrder,),
      MenuItem(name:"Spaghetti",
        details:"Spaghetti tossed in a fresh tomato sauce with olives, black pepper and basil leaves.",
        price: 15.50,
        imageName: "pasta", updateOrder: updateOrder,order: currentOrder,),
      MenuItem(name:"Italian Wedge Salad",
        details:"Iceberg lettuce, cherry tomatoes, red onions, Gorgonzola, and Italian dressing.",
        price: 8.50,
        imageName: "salad", updateOrder: updateOrder,order: currentOrder,),
      MenuItem(name:"Tiramisu",
        details:"Layers of coffee-soaked ladyfingers and mascarpone cheese dusted with cocoa powder.",
        price: 11,
        imageName: "tiramisu", updateOrder: updateOrder,order: currentOrder,),
      MenuItem(name:"Lemon Cake",
        details:"Traditional Italian fluffy lemon cake with fresh mint and powdered sugar on top.",
        price: 6.50,
        imageName: "lemon_cake", updateOrder: updateOrder,order: currentOrder,),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        shadowColor: Colors.black,
        centerTitle: true,
        title: const Text("Menu"),
        leading: const Icon(
        Icons.shopping_cart_outlined,
        color: Colors.blueGrey,
        size: 24,
      ),
      ),
      body:Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: menuDishes,
            ),
          ),
          TextButton(
              onPressed: (){
                //OrderManager.addOrderToStorage("123");
                print('view order 123');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderSummaryPage(currentOrder)),
                  );
                },
              child: const Text('View Order'),
          ),
        ],
      ),
    );
  }
}


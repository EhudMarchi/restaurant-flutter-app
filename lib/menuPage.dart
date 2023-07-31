import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/orderSummaryPage.dart';
import 'package:restaurant/restaurantOrder.dart';

import 'menuItem.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late List<MenuItem> menuDishes;
  late List<MenuItem> mains;
  late List<MenuItem> desserts;
  late List<MenuItem> drinks;
  late RestaurantOrder currentOrder = RestaurantOrder(orderId: '123', dishes: []);

  void updateOrder(RestaurantOrder newOrder) {
    setState(() {
      currentOrder = newOrder;
    });
  }

  void changeDisplayedItems(ItemType itemType) {
    setState(() {
      if(itemType == ItemType.main) {
        menuDishes = mains;
      }
      else if(itemType == ItemType.dessert)
        {
          menuDishes = desserts;
        }
      else
        {
          menuDishes = drinks;
        }
    });
  }

  @override
  void initState() {
    mains = [
      MenuItem(name:"Margherita Pizza",
        details:"Classic pizza topped with tomato sauce, fresh mozzarella, and basil leaves.",
        price: 17,
        imageName: "pizza", updateOrder: updateOrder, order: currentOrder, itemType: ItemType.main,),
      MenuItem(name:"Spaghetti",
        details:"Spaghetti tossed in a fresh tomato sauce with olives, black pepper and basil leaves.",
        price: 15.50,
        imageName: "pasta", updateOrder: updateOrder,order: currentOrder,itemType: ItemType.main,),
      MenuItem(name:"Italian Wedge Salad",
        details:"Iceberg lettuce, cherry tomatoes, red onions, Gorgonzola, and Italian dressing.",
        price: 8.50,
        imageName: "salad", updateOrder: updateOrder,order: currentOrder,itemType: ItemType.main,),
      MenuItem(name:"Risotto ai Funghi",
        details:"Creamy risotto cooked with porcini mushrooms, onions, white wine, and Parmigiano-Reggiano cheese.",
        price: 19.50,
        imageName: "risotto", updateOrder: updateOrder,order: currentOrder,itemType: ItemType.main,),
    ];
    desserts = [
      MenuItem(name:"Tiramisu",
        details:"Layers of coffee-soaked ladyfingers and mascarpone cheese dusted with cocoa powder.",
        price: 11,
        imageName: "tiramisu", updateOrder: updateOrder,order: currentOrder,itemType: ItemType.dessert,),
      MenuItem(name:"Lemon Cake",
        details:"Traditional Italian fluffy lemon cake with fresh mint and powdered sugar on top.",
        price: 6.50,
        imageName: "lemon_cake", updateOrder: updateOrder,order: currentOrder,itemType: ItemType.dessert,),
      MenuItem(name:"Zeppole",
        details:"Light and fluffy fried dough balls, dusted with powdered sugar.",
        price: 5.00,
        imageName: "zeppole", updateOrder: updateOrder,order: currentOrder,itemType: ItemType.dessert,),
    ];
    drinks = [
      MenuItem(name:"Cappuccino",
        details:"Espresso topped with steamed milk and a layer of frothy milk foam.",
        price: 4.50,
        imageName: "capuccino", updateOrder: updateOrder,order: currentOrder,itemType: ItemType.drink,),
      MenuItem(name:"Negroni",
        details:"A classic Italian cocktail made with equal parts gin, Campari, and sweet vermouth, garnished with an orange slice.",
        price: 7.50,
        imageName: "negroni", updateOrder: updateOrder,order: currentOrder,itemType: ItemType.drink,),
      MenuItem(name:"Limoncello",
        details:"A lemon-flavored liqueur, served chilled as a digestif.",
        price: 8,
        imageName: "limoncello", updateOrder: updateOrder,order: currentOrder,itemType: ItemType.drink,),
    ];

    menuDishes = mains;
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
          // Generated code for this Row Widget...
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        changeDisplayedItems(ItemType.main);
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.24,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: FaIcon(FontAwesomeIcons.pizzaSlice,size: 36,),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Text('Main'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        changeDisplayedItems(ItemType.dessert);
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.24,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: FaIcon(FontAwesomeIcons.iceCream,size: 36,)
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Text('Desserts'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        changeDisplayedItems(ItemType.drink);
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.24,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: FaIcon(FontAwesomeIcons.martiniGlassCitrus,size: 36,)
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Text('Drinks'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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


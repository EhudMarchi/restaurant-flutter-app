import 'package:flutter/material.dart';
import 'package:restaurant/menuItems.dart';
import 'package:restaurant/restaurantOrder.dart';
import 'package:restaurant/services/orderServices.dart';

enum ItemType {
  main,
  dessert,
  drink
}
class MenuItem extends StatelessWidget {
    MenuItem({
    super.key, required this.name, required this.details, required this.price, required this.imageName, required this.updateOrder, required this.order, required this.itemType,
  });
  final String name;
  final String details;
  final double price;
  final String imageName;
  final Function(RestaurantOrder) updateOrder;
  final RestaurantOrder order;
  final ItemType itemType;
  @override
  Widget build(BuildContext context) {
    RestaurantOrder currentOrder;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white60,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x2E000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Text(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Text(
                      '${price}\$',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.black, Colors.transparent],
                    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height-20));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/images/$imageName.jpg',
                    width: 400,
                    height: 150,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        details,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:12.0),
                child: GestureDetector(
                  child: const Icon(Icons.add_circle_outlined, color: Colors.amber, size: 30),
                  onTap: () => addDish(context, order),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> addDish(BuildContext context, RestaurantOrder currentOrder) {
    addItemToOrder(menuDishes.firstWhere((element) => element.name == name),currentOrder);
    updateOrder(currentOrder);
    printOrder(currentOrder);
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('$name was added to your order!'),
                ));
  }
}
import 'package:flutter/material.dart';
import 'package:restaurant/restaurantOrder.dart';

class OrderSummaryPage extends StatelessWidget {
   OrderSummaryPage(this.currentOrder, {super.key});
  RestaurantOrder currentOrder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter Italiano',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '123 Flutter Street, Flutter City',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Date: ${DateTime.now().toString()}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Divider(),
              SizedBox(height: 8),
              Text(
                'Order Items:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              for (var item in currentOrder.dishes) _buildOrderItem(item.name, item.price),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${currentOrder.totalPrice}\$',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: TextButton(
                  onPressed: (){
                    //OrderManager.addOrderToStorage("123");
                    print('submit order 123');
                  },
                  child: const Text('Submit Order'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildOrderItem(String name, double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: TextStyle(fontSize: 16)),
        Text('${price.toStringAsFixed(2)}\$', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

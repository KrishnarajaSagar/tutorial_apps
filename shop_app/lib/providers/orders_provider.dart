import 'package:flutter/foundation.dart';

import './cart_provider.dart';

class OrderItem {
  final String id;
  final List<CartItem> products;
  final double price;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.products,
    @required this.price,
    @required this.dateTime,
  });
}

class OrdersProvider with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double totalPrice) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        price: totalPrice,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}

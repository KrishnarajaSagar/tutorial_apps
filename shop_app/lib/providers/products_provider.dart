import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Shoes',
      description: 'Shoes description',
      price: 3999,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/61utX8kBDlL._UL1100_.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Jersey',
      description: 'Jersey description',
      price: 1499,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/61rHOZkgPNL._UL1300_.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Mobile',
      description: 'Mobile description',
      price: 19999,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/71muFgw3oPL._SL1500_.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Earphones',
      description: 'Earphones description',
      price: 1299,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/610co8JoMtL._SL1500_.jpg',
    ),
  ];

  var _favouritesOnly = false;

  List<Product> get items {
    // if (_favouritesOnly) {
    //   return _items.where((productItem) => productItem.isFavourite).toList();
    // }
    return [..._items];
  }

  List<Product> get favouriteItems {
    return _items.where((productId) => productId.isFavourite).toList();
  }

  // void showFavouritesOnly() {
  //   _favouritesOnly = true;
  //   notifyListeners();
  // }
  // void showAll() {
  //   _favouritesOnly = false;
  //   notifyListeners();
  // }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void addProduct(Product product) {
    const url = 'https://shop-app-flutter-77266.firebaseio.com/products.json';
    http.post(url, body: json.encode({
      'title' : product.title,
      'description' : product.description,
      'price' : product.price,
      'imageUrl' : product.imageUrl,
      'isFavourite' : product.isFavourite,
    }),);
    final newproduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      price: product.price,
      description: product.description,
      imageUrl: product.imageUrl,
    );
    _items.add(newproduct);
    notifyListeners();
  }

  void editProduct(String id, Product updatedProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = updatedProduct;
      notifyListeners();
    } else {
      print('Error');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}

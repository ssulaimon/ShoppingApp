import 'package:flutter/cupertino.dart';

import '../api_calls/data_model.dart';

class AddToCart extends ChangeNotifier {
  List<Data> myCartList = [];
  Data? _item;

  int get myCartLenght => myCartList.length;
  int _totalPrice = 0;

  int get totalPrice => _totalPrice;

  set totalPrice(int sum) {
    _totalPrice = sum;
    notifyListeners();
  }

  void addToCartList({required Data item}) {
    myCartList.add(item);
    notifyListeners();
  }

  void clearCart() {
    myCartList.clear();
    notifyListeners();
  }

  void removeItem({required int index}) {
    myCartList.removeAt(index);
    notifyListeners();
  }

  Data get item => _item!;

  set item(Data data) {
    _item = data;
    notifyListeners();
  }
}

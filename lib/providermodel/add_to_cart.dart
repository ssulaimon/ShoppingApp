import 'package:flutter/cupertino.dart';

import '../api_calls/data_model.dart';

class AddToCart extends ChangeNotifier {
  List<Data> myCartList = [];

  int get myCartLenght => myCartList.length;

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
}

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:test_app/api_calls/data_model.dart';

class ApiCall {
  Future<List<Data>?> apiCall() async {
    try {
      const String url = 'https://dummyjson.com/products';
      var uri = Uri.parse(url);
      Response response = await get(uri);
      if (response.statusCode == 200) {
        Map result = await jsonDecode(response.body);
        List<dynamic> products = await result['products'];

        return List.generate(products.length, (index) {
          return Data(
            brand: products[index]['brand'],
            description: products[index]['description'],
            title: products[index]['title'],
            thumbnail: products[index]['thumbnail'],
            images: products[index]['images'],
            rating: products[index]['rating'],
            stock: products[index]['stock'],
            category: products[index]['category'],
            price: products[index]['price'],
          );
        });
      } else {
        log(
          response.statusCode.toString(),
        );
      }
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }
}

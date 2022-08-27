import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providermodel/add_to_cart.dart';

import 'ui/shopping_item_list.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AddToCart(),
      builder: (context, provider) {
        return const MaterialApp(
          home: ShoppingList(),
        );
      },
    ),
  );
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:provider/provider.dart';
import 'package:test_app/api_calls/api.dart';
import 'package:test_app/api_calls/data_model.dart';
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

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providermodel/add_to_cart.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddToCart>(
      builder: (context, cartItems, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Check out'),
            backgroundColor: Colors.yellow,
            elevation: 0.0,
          ),
          body: Text(
            cartItems.myCartLenght.toString(),
          ),
        );
      },
    );
  }
}

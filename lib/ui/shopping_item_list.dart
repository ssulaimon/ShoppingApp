import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_app/api_calls/api.dart';
import 'package:test_app/api_calls/data_model.dart';
import 'package:test_app/providermodel/add_to_cart.dart';
import 'package:test_app/ui/checkout.dart';
import 'package:test_app/ui/product_details.dart';
import 'package:test_app/ui/rating_star.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddToCart>(builder: (context, cartItem, child) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.yellow,
            title: const Text(
              'GRABBY',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckOut(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 5.0,
                    left: 30.0,
                    child: Text(
                      cartItem.myCartLenght.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data>? items = snapshot.data as List<Data>?;
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 5.0,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 6.0),
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              6.0,
                            ),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                items![index].images[0],
                                width: double.infinity,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                items[index].title,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Flexible(
                                  child: Text(
                                      '\$${items[index].price.toString()}')),
                              items[index].rating < 4.60
                                  ? const Center(
                                      child: RatingStar(),
                                    )
                                  : const Center(
                                      child: FiveStar(),
                                    ),
                              Flexible(
                                child: FlatButton(
                                  onPressed: () {
                                    var snackBar = SnackBar(
                                      content: Text(
                                        '${items[index].title} add to your cart',
                                      ),
                                      elevation: 4.0,
                                      behavior: SnackBarBehavior.floating,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    cartItem.addToCartList(
                                      item: items[index],
                                    );
                                  },
                                  color: const Color(0xFFEDBF69),
                                  child: const Text(
                                    'Add to cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          cartItem.item = items[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetails(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  itemCount: items!.length,
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text(
                    'Loading Please wait......',
                  ),
                );
              } else {
                return const Text(
                  'Erorr',
                );
              }
            },
            future: ApiCall().apiCall(),
          ));
    });
  }
}

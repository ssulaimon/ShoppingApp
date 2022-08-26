import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providermodel/add_to_cart.dart';
import 'package:test_app/ui/rating_star.dart';

import '../api_calls/data_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddToCart>(
      builder: (contex, details, child) {
        Data data = details.item;
        return Scaffold(
            body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  data.thumbnail,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.title,
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          data.rating < 4.60
                              ? const RatingStar()
                              : const FiveStar()
                        ],
                      ),
                      const Text(
                        'Price',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${data.price.toString()}',
                          ),
                          Text(
                            '${data.rating.toString()}/5.0',
                          )
                        ],
                      ),
                      const Text(
                        'Stock Number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(data.stock.toString()),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Product Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data.description,
                        style: const TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Brand',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data.brand,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          width: double.infinity,
                          height: 50,
                          child: const Center(
                            child: Text('Add to cart'),
                          ),
                        ),
                        onTap: () {
                          var snackbar = SnackBar(
                            content: Text('${data.title} added to cart items'),
                            elevation: 10.0,
                            behavior: SnackBarBehavior.floating,
                          );
                          // ignore: deprecated_member_use
                          details.addToCartList(item: data);
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
      },
    );
  }
}

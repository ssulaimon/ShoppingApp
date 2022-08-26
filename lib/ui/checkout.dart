import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test_app/api_calls/data_model.dart';
import 'package:test_app/providermodel/add_to_cart.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    int sum = 0;
    return Consumer<AddToCart>(
      builder: (context, cartItems, child) {
        cartItems.myCartList.forEach(
          (element) {
            sum = sum + element.price;
          },
        );
        return Scaffold(
          appBar: AppBar(
            title: const Text('Check out'),
            backgroundColor: Colors.yellow,
            elevation: 0.0,
          ),
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    List<Data> data = cartItems.myCartList;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            data[index].images[0],
                            width: 100,
                            height: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                data[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\$${data[index].price.toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              FlatButton(
                                onPressed: () {
                                  int total = sum - data[index].price;
                                  cartItems.removeItem(index: index);
                                  setState(() {
                                    sum = total;
                                  });
                                },
                                color: const Color(0xFFEDBF69),
                                child: const Text(
                                  'Remove',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: cartItems.myCartLenght,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      color: const Color(0xFFEDBF69),
                      child: const Text(
                        'Check out',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Total Price: \$${sum.toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

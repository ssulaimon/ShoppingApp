import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providermodel/add_to_cart.dart';
import 'package:test_app/ui/mastercard_desgin.dart';

class PaymentUi extends StatelessWidget {
  const PaymentUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? name = TextEditingController();
    TextEditingController? cardNumber = TextEditingController();
    TextEditingController? cvv = TextEditingController();
    TextEditingController? expiremonth = TextEditingController();
    TextEditingController? expYear = TextEditingController();
    return Consumer<AddToCart>(builder: (context, itemPrice, child) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const MasterCardDesign(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Name On Card'),
                    controller: name,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Card Number'),
                    keyboardType: TextInputType.number,
                    controller: cardNumber,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: expiremonth,
                          decoration: const InputDecoration(hintText: 'Month'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: expYear,
                          decoration: const InputDecoration(hintText: 'Year'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: cvv,
                    decoration: const InputDecoration(hintText: 'CVV'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: itemPrice.totalPrice == 0 ? null : () {},
                    color: const Color(0xFFD78E4E),
                    child: Text(
                      'Proceed to pay \$${itemPrice.totalPrice.toString()}',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

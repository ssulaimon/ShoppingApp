import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_app/providermodel/add_to_cart.dart';
import 'package:test_app/providermodel/payment.details.dart';
import 'package:test_app/providermodel/payment_function.dart';
import 'package:test_app/ui/mastercard_desgin.dart';

import '../api_calls/data_model.dart';

class PaymentUi extends StatelessWidget {
  const PaymentUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? name;
    String? cardNumber;
    String? cvv;
    String? expiremonth;
    String? expYear;
    final _formKey = GlobalKey<FormState>();
    return Consumer<AddToCart>(builder: (context, itemPrice, child) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const MasterCardDesign(),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        } else {
                          name = value;
                        }
                      },
                      decoration:
                          const InputDecoration(hintText: 'Name On Card'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: 'Card Number'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter card number';
                        } else if (value.length < 16 || value.length > 16) {
                          return 'card number invalid';
                        } else {
                          cardNumber = value;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'Month'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'required';
                              } else if (value.length < 2 || value.length > 2) {
                                return 'Check number';
                              } else {
                                expiremonth = value;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 50.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: const InputDecoration(hintText: 'Year'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              } else if (value.length < 2 || value.length > 2) {
                                return 'Check number';
                              } else {
                                expYear = value;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'CVV'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        } else if (value.length < 3 || value.length > 3) {
                          return 'Check number';
                        } else {
                          cvv = value;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: itemPrice.totalPrice == 0
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                DateTime date = DateTime.now();
                                String? items;

                                for (int i = 0;
                                    i < itemPrice.myCartLenght;
                                    i++) {
                                  List<Data> data = itemPrice.myCartList;
                                  if (items == null) {
                                    items =
                                        '${data[i].title} - \$${data[i].price.toString()}\n';
                                  } else {
                                    items =
                                        '$items \n ${data[i].title} - \$${data[i].price.toString()}\n';
                                  }
                                }

                                String? paymentFuction = await PaymentFuction()
                                    .paymentDetails(
                                        items: items!,
                                        name: name!,
                                        cvv: cvv!,
                                        expMonth: expiremonth!,
                                        expYear: expYear!,
                                        cardNumber: cardNumber!,
                                        date:
                                            DateTime.now().toLocal().toString(),
                                        amountPaid:
                                            itemPrice.totalPrice.toString(),
                                        itemNumber:
                                            itemPrice.myCartLenght.toString());
                                if (paymentFuction == 'completed') {
                                  var snackBar = const SnackBar(
                                    content: Text(
                                        'Completed. Check download folder for reciept'),
                                    elevation: 0.0,
                                    behavior: SnackBarBehavior.floating,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  var snackBar = SnackBar(
                                    content: Text(paymentFuction!),
                                    elevation: 0.0,
                                    behavior: SnackBarBehavior.floating,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            },
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
        ),
      );
    });
  }
}

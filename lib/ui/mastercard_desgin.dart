import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MasterCardDesign extends StatelessWidget {
  const MasterCardDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF292D39),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE9E9E9),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                height: 40,
                width: 50,
              ),
              const Text(
                '490***',
                style: TextStyle(color: Color(0xFFE9E9E9)),
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'SALAUDEEN SULAIMON.O',
                style: TextStyle(
                  color: Color(0xFFE9E9E9),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFC83F40),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    height: 30,
                    width: 30,
                  ),
                  Positioned(
                    left: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFD78E4E),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 30,
                      width: 30,
                    ),
                  )
                ],
              )
            ],
          ),
          const Text(
            'Mastercard',
            style: TextStyle(
              color: Color(0xFFE9E9E9),
            ),
          )
        ],
      ),
    );
  }
}

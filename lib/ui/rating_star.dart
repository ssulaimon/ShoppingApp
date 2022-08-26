import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.star,
          color: Colors.red,
          size: 20,
        ),
        Icon(
          size: 20,
          Icons.star,
          color: Colors.red,
        ),
        Icon(
          size: 20,
          Icons.star,
          color: Colors.red,
        ),
        Icon(
          size: 20,
          Icons.star,
          color: Colors.grey,
        ),
        Icon(
          size: 20,
          Icons.star,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class FiveStar extends StatelessWidget {
  const FiveStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          size: 20,
          Icons.star,
          color: Colors.red,
        ),
        Icon(
          size: 20,
          Icons.star,
          color: Colors.red,
        ),
        Icon(
          size: 20,
          Icons.star,
          color: Colors.red,
        ),
        Icon(
          size: 20,
          Icons.star,
          color: Colors.red,
        ),
        Icon(
          size: 20,
          Icons.star,
          color: Colors.red,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sarkar/model/productmodel.dart';

class Products extends StatelessWidget {
  const Products({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 180,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                    image: NetworkImage(product.imagelist[0]),
                    fit: BoxFit.cover))),
        const SizedBox(
          height: 5,
        ),
        Text(
          product.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 100),
          child: Text(
            '€${product.price} ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

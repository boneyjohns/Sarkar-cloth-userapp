import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/const/const.dart';
import 'package:sarkar/controller/shoppingcontroller.dart';
import 'package:sarkar/model/productmodel.dart';

class Bagbutton extends StatelessWidget {
  const Bagbutton({
    super.key,
    required this.shoppingcontroller,
    required this.brand,
  });

  final Shoppingcontroller shoppingcontroller;
  final ProductModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        shoppingcontroller.cartlist.add(brand);
        log(shoppingcontroller.cartlist.length.toString());
        Get.snackbar('Item Added', 'Product added to Bag',
            backgroundColor: Colors.blue,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 1));
      },
      child: Container(
        width: 180,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.black),
        child: Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Row(
              children: const [
                Icon(
                  Icons.shopping_bag,
                  color: kwhite,
                ),
                Text(
                  'Add to Bag',
                  style: TextStyle(color: kwhite),
                )
              ],
            )),
      ),
    );
  }
}

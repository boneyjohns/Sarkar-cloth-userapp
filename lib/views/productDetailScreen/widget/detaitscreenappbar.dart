import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/const/const.dart';
import 'package:sarkar/views/commenwidgets/myappbar.dart';
import 'package:sarkar/views/shoppingbag_screen/shopping_bag_screen.dart';

class Productdetailappbar extends StatelessWidget {
  const Productdetailappbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Myappbar(
      centertitle: true,
      heading: const Text(
        'Details',
        style: TextStyle(color: kblack, fontWeight: FontWeight.normal),
      ),
      action: [
        IconButton(
            onPressed: () {
              Get.off(ShoppingBag());
            },
            icon: const Icon(Icons.shopping_bag, color: kblack))
      ],
      lead: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back),
        color: kblack,
      ),
    );
  }
}

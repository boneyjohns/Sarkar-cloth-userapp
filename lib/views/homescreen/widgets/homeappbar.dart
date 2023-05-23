import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/const/const.dart';
import 'package:sarkar/views/commenwidgets/myappbar.dart';
import 'package:sarkar/views/searchscreen/searchscreen.dart';
import 'package:sarkar/views/shoppingbag_screen/shopping_bag_screen.dart';

class Homeappbar extends StatelessWidget {
  const Homeappbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Myappbar(
      centertitle: false,
      lead: const CircleAvatar(backgroundImage: AssetImage('asset/pro.jpg')),
      heading: const Text(
        'Hi, Arif',
        style: TextStyle(color: kblack),
      ),
      action: [
        IconButton(
            onPressed: () {
              Get.to(SearchScreen());
            },
            icon: const Icon(
              Icons.search,
              color: kblack,
            )),
        IconButton(
            onPressed: () {
              Get.to(ShoppingBag());
            },
            icon: const Icon(Icons.shopping_bag, color: kblack))
      ],
    );
  }
}

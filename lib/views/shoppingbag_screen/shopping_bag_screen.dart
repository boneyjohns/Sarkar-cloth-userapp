import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/const/const.dart';
import 'package:sarkar/controller/shoppingcontroller.dart';

class ShoppingBag extends StatelessWidget {
  ShoppingBag({
    super.key,
  });
  final shopping = Get.put(Shoppingcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
        title: const Text(
          "shopping items",
          style: TextStyle(color: kblack),
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: kblack,
            ),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 300,
            child: GetX<Shoppingcontroller>(builder: (c) {
              return ListView.builder(
                itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        shopping.cartlist[index].imagelist[0],
                      ),
                    ),
                    title: Text(shopping.cartlist[index].name),
                    subtitle: Text('€${shopping.cartlist[index].price}'),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        shopping.cartlist.removeAt(index);
                        Get.snackbar('Item Removed', 'Product removed from Bag',
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 1));
                      },
                    )),
                itemCount: c.cartlist.length,
              );
            }),
          )),
    );
  }
}

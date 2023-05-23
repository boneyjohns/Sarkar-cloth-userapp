import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/controller/searchcontroller.dart';
import 'package:sarkar/views/commenwidgets/product.dart';
import 'package:sarkar/views/productDetailScreen/detailscreen.dart';

class Searchproducts extends StatelessWidget {
  const Searchproducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: GetBuilder<Searchcontroller>(
          init: Searchcontroller(),
          builder: (searchcontroller) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    childAspectRatio: 5 / 7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: searchcontroller.searchlist.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                      onTap: () => Get.to(
                            () => Details(
                                brand: searchcontroller.searchlist[index]),
                          ),
                      child: Products(
                          product: searchcontroller.searchlist[index]));
                });
          }),
    );
  }
}

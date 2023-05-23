import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/model/productmodel.dart';
import 'package:sarkar/views/commenwidgets/product.dart';
import 'package:sarkar/views/productDetailScreen/detailscreen.dart';

class Allproducts extends StatelessWidget {
  const Allproducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<List<ProductModel>>(
              stream: FirebaseFirestore.instance
                  .collection('search')
                  .snapshots()
                  .map((snapshot) => snapshot.docs
                      .map((e) => ProductModel.fromJson(e.data()))
                      .toList()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error Occured"),
                  );
                } else if (snapshot.data == null) {
                  return const Center(
                    child: Text("Empty"),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<ProductModel> documentSnapshot = snapshot.data!;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 7 / 10,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 8),
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(Details(brand: documentSnapshot[index]));
                        },
                        child: Products(
                          product: documentSnapshot[index],
                        ),
                      );
                    },
                    itemCount: documentSnapshot.length,
                  );
                }
              })),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/const/const.dart';
import 'package:sarkar/model/productmodel.dart';
import 'package:sarkar/views/commenwidgets/product.dart';
import 'package:sarkar/views/productDetailScreen/detailscreen.dart';

class Listofproducts extends StatelessWidget {
  const Listofproducts({
    required this.brandname,
    super.key,
  });
  final String brandname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          brandname,
          style: const TextStyle(color: kblack),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kblack,
            )),
        centerTitle: true,
        backgroundColor: kwhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: StreamBuilder<List<ProductModel>>(
            stream: FirebaseFirestore.instance
                .collection('categories')
                .doc(brandname)
                .collection(brandname)
                .snapshots()
                .map((snapshot) => snapshot.docs
                    .map((e) => ProductModel.fromJson(e.data()))
                    .toList()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 180,
                            childAspectRatio: 6 / 10,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      List<ProductModel> documentSnapshot = snapshot.data!;

                      return InkWell(
                        onTap: () => Get.to(
                          () => Details(brand: documentSnapshot[index]),
                        ),
                        child: Products(product: documentSnapshot[index]),
                      );
                    });
              } else {
                return const Text('nodata');
              }
            }),
      ),
    );
  }
}

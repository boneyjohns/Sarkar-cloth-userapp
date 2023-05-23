import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/const/const.dart';
import 'package:sarkar/controller/searchcontroller.dart';
import 'package:sarkar/model/productmodel.dart';
import 'package:sarkar/views/searchscreen/widgets/seachproducts.dart';
import 'package:sarkar/views/searchscreen/widgets/searchappbar.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final search = TextEditingController();
  final c = Get.put(Searchcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: appbarheight,
        child: Seachappbar(search: search),
      ),
      body: StreamBuilder<List<ProductModel>>(
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
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Searchproducts();
            }
          }),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/views/commenwidgets/catebutton.dart';
import 'package:sarkar/views/categoriesscreen/categorieslist.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 20,
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('categories').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => Listofproducts(
                                brandname: documentSnapshot['name']),
                          );
                        },
                        child: CateButton(
                          name: documentSnapshot['name'],
                        ),
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) => const Divider(
                      endIndent: 40,
                    ),
                  ),
                );
              } else {
                return const Text('Categories list is empty');
              }
            }),
      ),
    );
  }
}

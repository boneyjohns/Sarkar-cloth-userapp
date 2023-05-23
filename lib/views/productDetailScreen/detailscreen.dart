import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/const/const.dart';
import 'package:sarkar/controller/colourcontroller.dart';
import 'package:sarkar/controller/shoppingcontroller.dart';
import 'package:sarkar/model/productmodel.dart';
import 'package:sarkar/views/productDetailScreen/widget/bagbutton.dart';
import 'package:sarkar/views/productDetailScreen/widget/detaitscreenappbar.dart';
import 'package:sarkar/views/productDetailScreen/widget/dresssize.dart';
import 'package:sarkar/views/commenwidgets/pageview.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.brand});

  final ProductModel brand;

  final Colourcontroller colourcontroller = Get.put(Colourcontroller());
  final Shoppingcontroller shoppingcontroller = Get.put(Shoppingcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Productdetailappbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: PageViewWidget(
                productimage: brand.imagelist,
              )),
              kheight20,
              Row(
                children: [
                  Text(
                    brand.name,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () {
                      colourcontroller.selectedindex(0);
                    },
                    child: const CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      colourcontroller.selectedindex(1);
                    },
                    child: const CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      colourcontroller.selectedindex(2);
                    },
                    child: const CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/rateing.jpeg'))),
                ),
              ),
              const Dresssize(),
              kheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '€${brand.price}',
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: kblack),
                  ),
                  Bagbutton(
                      shoppingcontroller: shoppingcontroller, brand: brand),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

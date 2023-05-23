import 'package:flutter/material.dart';
import 'package:sarkar/const/const.dart';
import 'package:sarkar/views/homescreen/widgets/allproducts.dart';
import 'package:sarkar/views/homescreen/widgets/categories.dart';
import 'package:sarkar/views/homescreen/widgets/homeappbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        appBar: const PreferredSize(
            preferredSize: appbarheight, child: Homeappbar()),
        body: Column(children: [
          Container(
            height: 140,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('asset/text.jpeg'))),
          ),
          Row(
            children: const [
              kwidth15,
              Text(
                'Categories',
                style: catetext,
              ),
            ],
          ),
          kheight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              kwidth15,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kblack,
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 6, left: 22, right: 22, bottom: 6),
                  child: Text(
                    'All',
                    style: TextStyle(fontSize: 20, color: kwhite),
                  ),
                ),
              ),
              kwidth15,
              const Categories(),
            ],
          ),
          kheight10,
          const Allproducts()
        ]));
  }
}

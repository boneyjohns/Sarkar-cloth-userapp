import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/controller/colourcontroller.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    required this.productimage,
    Key? key,
  }) : super(key: key);

  final List productimage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GetX<Colourcontroller>(builder: (c) {
        return Container(
          height: 450,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                  image: NetworkImage(productimage[c.selectedindex.value]),
                  fit: BoxFit.cover)),
        );
      }),
    );
  }
}

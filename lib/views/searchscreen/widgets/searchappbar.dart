import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkar/const/const.dart';
import 'package:sarkar/controller/searchcontroller.dart';
import 'package:sarkar/views/commenwidgets/myappbar.dart';
import 'package:sarkar/views/homescreen/home.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class Seachappbar extends StatelessWidget {
  Seachappbar({
    super.key,
    required this.search,
  });

  final TextEditingController search;
  final Searchcontroller s = Get.put(Searchcontroller());

  @override
  Widget build(BuildContext context) {
    return Myappbar(
      heading: GetBuilder<Searchcontroller>(builder: (c) {
        return SearchBarAnimation(
          textEditingController: search,
          isOriginalAnimation: false,
          trailingWidget: const Icon(Icons.search),
          secondaryButtonWidget: const Icon(Icons.close),
          buttonWidget: const Icon(Icons.search),
          buttonColour: kblack,
          buttonShadowColour: kwhite,
          durationInMilliSeconds: 1000,
          onChanged: (val) {
            c.search(val);
          },
        );
      }),
      centertitle: true,
      lead: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kblack,
          ),
          onPressed: () {
            Get.off(const MyHomePage());
            s.search('');
          }),
      action: const [],
    );
  }
}

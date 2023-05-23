import 'package:flutter/material.dart';

class Myappbar extends StatelessWidget {
  const Myappbar({
    super.key,
    required this.lead,
    required this.heading,
    required this.action,
    required this.centertitle,
  });

  final Widget lead;
  final Widget heading;
  final List<Widget> action;
  final bool centertitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: lead,
      title: heading,
      actions: action,
      backgroundColor: Colors.white,
      centerTitle: centertitle,
    );
  }
}

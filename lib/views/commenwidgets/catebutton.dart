import 'package:flutter/material.dart';

class CateButton extends StatelessWidget {
  const CateButton({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        name,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

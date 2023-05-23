import 'package:flutter/material.dart';

class Dresssize extends StatelessWidget {
  const Dresssize({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        InputChip(label: Text('  S  ')),
        InputChip(label: Text('  M  ')),
        InputChip(
          label: Text('  L  '),
        ),
        InputChip(label: Text(' XL '))
      ],
    );
  }
}

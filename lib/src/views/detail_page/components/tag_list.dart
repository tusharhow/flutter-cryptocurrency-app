import 'package:flutter/material.dart';
import '../../../domain/models/coin_detail.dart';

class TagList extends StatelessWidget {
  const TagList({super.key, required this.coin});

  final CoinDetail? coin;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 8,
      direction: Axis.horizontal,
      children: coin!.tags!.map((tag) {
        return Chip(
          label: Text(tag.name!, style: const TextStyle(color: Colors.green)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(color: Colors.green, width: 10.0),
          ),
          backgroundColor: Colors.black,
        );
      }).toList(),
    );
  }
}

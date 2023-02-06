import 'package:flutter/material.dart';
import '../../../domain/models/coin.dart';

class CoinList extends StatelessWidget {
  const CoinList({super.key, required this.coin, required this.onTap});

  final Coin? coin;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(coin!.name!, style: const TextStyle(color: Colors.white)),
      subtitle: Text(
        coin!.symbol!,
        style: const TextStyle(color: Colors.white),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(coin!.rank.toString()),
      ),
      trailing: Text(
        coin!.isActive == true ? 'Active' : 'Inactive',
        style: TextStyle(
          color: coin!.isActive == true ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}

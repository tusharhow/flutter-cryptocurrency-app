import 'package:flutter/material.dart';
import '../../../domain/models/coin_detail.dart';


class TeamMemberList extends StatelessWidget {
  const TeamMemberList({
    super.key,
    required this.coin,
    required this.index,
  });

  final CoinDetail? coin;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(index < 9 ? '0${index + 1}' : '${index + 1}'),
      ),
      title: Text(
        coin!.team![index].name!,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        coin!.team![index].position!,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}

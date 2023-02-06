import 'package:flutter/material.dart';
import 'package:flutter_cryptocurrency_app/src/controllers/coin_controller.dart';
import '../detail_page/detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final CoinController _coinController = CoinController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
              future: _coinController.getCoins(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: _coinController.coins.length,
                    itemBuilder: (context, index) {
                      final coin = _coinController.coins[index];
                      return ListTile(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              id: coin.id!,
                            ),
                          ),
                        ),
                        title: Text(coin.name!,
                            style: const TextStyle(color: Colors.white)),
                        subtitle: Text(
                          coin.symbol!,
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(coin.rank.toString()),
                        ),
                        trailing: Text(
                          coin.isActive == true ? 'Active' : 'Inactive',
                          style: TextStyle(
                            color: coin.isActive == true
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

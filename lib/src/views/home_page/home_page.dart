import 'package:flutter/material.dart';
import 'package:flutter_cryptocurrency_app/src/controllers/coin_controller.dart';
import 'package:flutter_cryptocurrency_app/src/views/home_page/components/coin_list.dart';
import '../detail_page/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CoinController _coinController = CoinController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
              future: _coinController.getCoins(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final coin = snapshot.data![index];
                      return CoinList(
                        coin: coin,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              id: coin.id!,
                            ),
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

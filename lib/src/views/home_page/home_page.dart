import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cryptocurrency_app/src/bloc/coin_bloc.dart';
import 'package:flutter_cryptocurrency_app/src/views/home_page/components/coin_list.dart';
import '../detail_page/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state is CoinInitial) {
            BlocProvider.of<CoinBloc>(context).add(FetchCoinData());
            return const SizedBox();
          } else if (state is CoinLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CoinLoaded) {
            return ListView.builder(
              itemCount: state.coins.length,
              itemBuilder: (context, index) {
                final coin = state.coins[index];
                return CoinList(
                  coin: coin,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          id: coin.id!,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text('Error Occured'),
            );
          }
        },
      ),
    );
  }
}

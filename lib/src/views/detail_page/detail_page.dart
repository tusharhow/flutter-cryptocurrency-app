import 'package:flutter/material.dart';
import '../../controllers/coin_controller.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.id}) : super(key: key);
  final String id;
  final CoinController _coinController = CoinController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
              child: FutureBuilder(
            future: _coinController.getCoinById(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final coin = snapshot.data;
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            '${coin!.rank}. ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            coin.name!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            coin.isActive == true ? 'Active' : 'Inactive',
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        coin.description!,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Tags:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: coin.tags!.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Center(
                            child: Text(
                              tag.name!,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Team Members',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: coin.team!.map((member) {
                        return Column(
                          children: [
                            Text(
                              member.name!,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              member.position!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
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
          ))
        ],
      ),
    );
  }
}

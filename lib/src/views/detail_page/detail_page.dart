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
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _coinController.getCoinById(id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final coin = snapshot.data;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${coin!.rank}. ${coin.name!}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
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
                      const SizedBox(height: 16),
                      Wrap(
                        runSpacing: 8,
                        spacing: 8,
                        direction: Axis.horizontal,
                        children: coin.tags!.map((tag) {
                          return Chip(
                            label: Text(tag.name!,
                                style: const TextStyle(color: Colors.green)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: const BorderSide(
                                  color: Colors.green, width: 10.0),
                            ),
                            backgroundColor: Colors.black,
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
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Text(index < 9
                                    ? '0${index + 1}'
                                    : '${index + 1}'),
                              ),
                              title: Text(
                                coin.team![index].name!,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                coin.team![index].position!,
                                style: const TextStyle(color: Colors.white54),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                                color: Colors.white30,
                              ),
                          itemCount: coin.team!.length),
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
            )
          ],
        ),
      ),
    );
  }
}

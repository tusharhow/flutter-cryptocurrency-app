import 'package:flutter/material.dart';
import '../common/api_constants.dart';
import '../domain/models/coin.dart';
import '../domain/models/coin_detail.dart';
import '../domain/services/network_service.dart';

class CoinController extends ChangeNotifier {
  final NetworkService _networkService = NetworkService();

  CoinController() {
    getCoins();
  }

  Future<List<Coin>> getCoins() async {
    try {
      final response = await _networkService.get(COINS);
      final List<dynamic> data = response.data;
      final coins = data.map((e) => Coin.fromJson(e)).toList();
      notifyListeners();
      return coins;
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  Future<CoinDetail> getCoinById(String id) async {
    try {
      final response = await _networkService.getCoinById('$COIN/$id');
      final Map<String, dynamic> data = response.data;
      final CoinDetail coin = CoinDetail.fromJson(data);
      notifyListeners();
      return coin;
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}

import '../common/api_constants.dart';
import '../domain/models/coin.dart';
import '../domain/models/coin_detail.dart';
import '../domain/services/network_service.dart';

class CoinRepository {
  final NetworkService _networkService = NetworkService();

  Future<List<Coin>> getCoins() async {
    try {
      final response = await _networkService.get(COINS);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final coins = data.map((e) => Coin.fromJson(e)).toList();
        return coins;
      } else {
        throw 'Error';
      }
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  Future<CoinDetail> getCoinById(String id) async {
    try {
      final response = await _networkService.get('$COIN/$id');
      if (response.statusCode == 200) {
        final data = response.data;
        final coin = CoinDetail.fromJson(data);
        return coin;
      } else {
        throw 'Error';
      }
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}

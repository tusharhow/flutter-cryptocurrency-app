part of 'coin_bloc.dart';

@immutable
abstract class CoinEvent {}

class FetchCoinData extends CoinEvent {}

class GetCoinByIdEvent extends CoinEvent {
  final String id;

  GetCoinByIdEvent(this.id);
}

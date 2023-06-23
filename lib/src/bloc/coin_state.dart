part of 'coin_bloc.dart';

@immutable
abstract class CoinState {}

class CoinInitial extends CoinState {}

class CoinLoading extends CoinState {}

class CoinLoaded extends CoinState {
  final List<Coin> coins;

  CoinLoaded(this.coins);
}

class CoinLoadedDetail extends CoinState {
  final CoinDetail coin;

  CoinLoadedDetail(this.coin);
}

class CoinError extends CoinState {
  final String message;

  CoinError(this.message);
}

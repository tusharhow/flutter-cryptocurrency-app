import 'package:bloc/bloc.dart';
import 'package:flutter_cryptocurrency_app/src/domain/models/coin.dart';
import 'package:flutter_cryptocurrency_app/src/domain/models/coin_detail.dart';
import 'package:flutter_cryptocurrency_app/src/repositories/coin_repository.dart';
import 'package:meta/meta.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc(CoinRepository coinRepository) : super(CoinInitial()) {
    final CoinRepository coinRepository = CoinRepository();
    on<CoinEvent>((event, emit) async {
      try {
        if (event is FetchCoinData) {
          emit(CoinLoading());

          try {
            final coins = await coinRepository.getCoins();
            emit(CoinLoaded(coins));
          } catch (e) {
            emit(CoinError(e.toString()));
          }
        }
      } catch (e) {
        emit(CoinError(e.toString()));
      }
    });

    on<GetCoinByIdEvent>((event, emit) async {
      try {
        emit(CoinLoading());

        try {
          final coin = await coinRepository.getCoinById(event.id);
          emit(CoinLoadedDetail(coin));
        } catch (e) {
          emit(CoinError(e.toString()));
        }
      } catch (e) {
        emit(CoinError(e.toString()));
      }
    });
  }
}

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'controllers/coin_controller.dart';

class DI {
  final providers = [
    ChangeNotifierProvider(create: (_) => CoinController()),
  ];

  static DI get instance => DI();

  List<SingleChildWidget> getProviders() => providers;
}

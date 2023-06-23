import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cryptocurrency_app/src/bloc/coin_bloc.dart';
import 'package:flutter_cryptocurrency_app/src/repositories/coin_repository.dart';
import 'src/views/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinBloc(CoinRepository()),
      child: MaterialApp(
        title: 'Flutter Cryptocurrency App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

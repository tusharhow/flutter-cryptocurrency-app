import 'package:flutter/material.dart';
import 'package:flutter_cryptocurrency_app/src/di.dart';
import 'package:provider/provider.dart';
import 'src/views/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: DI.instance.getProviders(),
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

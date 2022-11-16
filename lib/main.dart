import 'package:flutter/material.dart';

import 'views/login.dart';
import 'views/news.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const LoginView(),
      initialRoute: '/',
      routes: {
        '/' : (context) => const LoginView(),
        NewsView.routeName : (context) => const NewsView(),
      },
      // home: const NewsView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home.dart';
import 'screens/schedule.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: <GoRoute>[
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
    ),
    GoRoute(
      path: '/schedule',
      builder: (BuildContext context, GoRouterState state) {
        return const Schedule();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

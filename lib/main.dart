import 'package:lichtline/routes.dart';
import 'package:flutter/material.dart';
import 'package:lichtline/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lichtline',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        return onGenerateRoutes(settings);
      },
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

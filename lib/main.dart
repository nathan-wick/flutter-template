import 'package:flutter/material.dart';
import 'widgets/navigation.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: Enter the app's name.
      title: 'App Name',
      theme: ThemeData(
        // TODO: Enter the app's colors.
        primarySwatch: Colors.blue,
      ),
      home: const Navigation(),
    );
  }
}
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'contexts/authentication.dart';
import 'information/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Name', // TODO: Enter the app's name.
      theme: ThemeData(
        primarySwatch: Colors.blue, // TODO: Enter the app's colors.
      ),
      home: const Authentication(),
      debugShowCheckedModeBanner: false,
    );
  }
}
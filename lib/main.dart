import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/contexts/authentication.dart';

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
      // TODO: Enter the app's name.
      title: 'App Name',
      theme: ThemeData(
        // TODO: Enter the app's colors.
        primarySwatch: Colors.blue,
      ),
      home: const Authentication(),
      debugShowCheckedModeBanner: false,
    );
  }
}
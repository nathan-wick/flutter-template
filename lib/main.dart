import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'information/firebase_options.dart';
import 'models/user.dart';
import 'screens/authenticated/profile.dart';
import 'screens/authenticated/settings.dart';
import 'services/database.dart';
import 'screens/sign_in.dart';
import 'screens/authenticated/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  Widget checkAuthState(BuildContext context, Widget destination) {
    return context.watch<User?>() == null ? const SignIn() : destination;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>(
          create: (context) => FirebaseAuth.instance.authStateChanges(),
          initialData: null,
        ),
        FutureProvider<UserModel?>(
          create: (context) => DatabaseService().getUser(),
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'App Name', // TODO: Enter the app's name.
        theme: ThemeData(
          primarySwatch: Colors.blue, // TODO: Enter the app's colors.
        ),
        routes: {
          '/': (context) => checkAuthState(context, const Home()),
          '/sign-in': (context) => checkAuthState(context, const SignIn()),
          '/home': (context) => checkAuthState(context, const Home()),
          '/profile': (context) => checkAuthState(context, const Profile()),
          '/settings': (context) => checkAuthState(context, const Settings()),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

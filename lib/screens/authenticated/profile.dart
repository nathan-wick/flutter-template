import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../screens/authenticated/settings.dart';
import '../../widgets/button_input.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Image.network(
                user.photo ?? '',
                width: 100,
                height: 100,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Icon(
                    Icons.account_circle,
                    size: 100,
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                user.name ?? '',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                user.email ?? '',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              ButtonInput(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
                icon: Icons.settings,
                message: 'Settings',
                theme: ButtonInputTheme.primary,
              ),
              const SizedBox(height: 20),
              ButtonInput(
                onTap: () {
                  firebase_auth.FirebaseAuth.instance.signOut();
                },
                icon: Icons.arrow_back,
                message: 'Sign Out',
                theme: ButtonInputTheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
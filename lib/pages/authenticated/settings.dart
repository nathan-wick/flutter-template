import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../contexts/authentication.dart';
import '../../widgets/button_input.dart';
import '../../widgets/text_input.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final user = FirebaseAuth.instance.currentUser!;
  late final nameController = TextEditingController(text: user.displayName ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ButtonInput(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Authentication()),
                  );
                },
                icon: Icons.save,
                message: 'Save and Exit',
                theme: ButtonInputTheme.primary,
              ),
              const SizedBox(height: 40),
              TextInput(
                controller: nameController,
                name: 'Display Name',
                example: 'Darth Vader',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
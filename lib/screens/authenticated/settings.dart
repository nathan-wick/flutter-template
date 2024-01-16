import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../services/database.dart';
import '../../widgets/button_input.dart';
import '../../widgets/text_input.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final nameController = TextEditingController();

  void exit() {
    Navigator.popAndPushNamed(context, '/profile');
  }

  void save(UserModel newUser) async {
    if (newUser.name != nameController.text) {
      newUser.name = nameController.text;
      await DatabaseService().updateUser(newUser);
    }
    exit();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ButtonInput(
                onTap: () {
                  save(user);
                },
                icon: Icons.arrow_back,
                message: 'Save and Exit',
                theme: ButtonInputTheme.primary,
              ),
              const SizedBox(height: 40),
              TextInput(
                controller: nameController,
                defaultValue: user.name,
                name: 'Name',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

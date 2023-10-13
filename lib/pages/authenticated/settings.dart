import 'package:flutter/material.dart';

import '../../contexts/authentication.dart';
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
  late Future<User> user;
  late final nameController = TextEditingController();

  void exit() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Authentication()),
    );
  }

  void save() async {
    final newUser = await user;
    if (newUser.name != nameController.text) {
      newUser.name = nameController.text;
      await DatabaseService().updateUser(newUser);
    }
    exit();
  }

  @override
  void initState() {
    super.initState();
    user = DatabaseService().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<User>(
            future: user,
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    ButtonInput(
                      onTap: save,
                      icon: Icons.arrow_back,
                      message: 'Save and Exit',
                      theme: ButtonInputTheme.primary,
                    ),
                    const SizedBox(height: 40),
                    TextInput(
                      controller: nameController,
                      defaultValue: snapshot.data?.name,
                      name: 'Name',
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                exit();
              } else {
                return const CircularProgressIndicator();
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
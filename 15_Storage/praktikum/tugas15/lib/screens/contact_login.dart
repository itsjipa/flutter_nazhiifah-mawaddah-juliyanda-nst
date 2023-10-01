// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas15/screens/contact_screen.dart';
import 'package:tugas15/utils/contact_sharedpreferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 240.0,
          ),
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle_outlined,
                    ),
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value != null && value.length < 4) {
                      return 'Enter at least 4 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' Please input your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please input correct email';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.password_outlined,
                    ),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (value) {
                    if (value != null && value.length < 5) {
                      return 'Enter min. 5 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      _logIn();
                    },
                    child: const Text(
                      'Login',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _logIn() async {
    final isValidForm = formKey.currentState!.validate();
    String username = nameController.text;

    await LoginSharedPreferences.saveUserLogInPrefernces(true);
    await LoginSharedPreferences.saveUserNamePreference(username);

    if (isValidForm) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const ContactScreen(),
          ),
          (route) => false);
    }
  }
}

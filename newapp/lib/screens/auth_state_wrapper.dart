import 'package:flutter/material.dart';
import 'package:newapp/models/auth_provider.dart';
import 'package:newapp/screens/home_screen.dart';
import 'package:newapp/screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class AuthState extends StatelessWidget {
  const AuthState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return user == null ? const LoginScreen() : HomePage(email: user.email);
  }
}

import 'package:flutter/material.dart';
import 'package:homie/auth/auth_service.dart';
import 'package:homie/pages/home_page.dart';
import 'package:homie/pages/login.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    print("Redirecting...");
    if (auth.isLoggedIn) {
      return const HomePage();
    }
    return const LoginPage();
  }
}

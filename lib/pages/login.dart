import 'package:flutter/material.dart';
import 'package:homie/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    print("Login");

    return Scaffold(
      body: Container(
        child: Center(
          child: 
            Text(auth.currentUser?.email ?? "null")
          ),
      ),
    );
  }
}

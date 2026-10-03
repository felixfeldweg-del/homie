import 'package:flutter/material.dart';
import 'package:homie/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();

    TextEditingController passwordController = new TextEditingController();
    TextEditingController emailController = new TextEditingController();

    void login() {
      auth.login(
        emailController.text.trim(),
        passwordController.text);
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            constraints: BoxConstraints(minWidth: 200, maxWidth: 400),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text("Welcome to Homie"),
                  TextField(controller: emailController),
                  TextField(controller: passwordController, obscureText: true),
                  MaterialButton(
                    onPressed: login,
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

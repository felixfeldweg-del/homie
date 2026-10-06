import 'package:flutter/material.dart';
import 'package:homie/auth/auth_service.dart';
import 'package:homie/widgets/panel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          child: Panel(
            minWidth: 200,
            maxWidth: 400,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text("Welcome to Homie"),
                  if(auth.errorMessage != null) 
                    Text(
                      auth.errorMessage!,
                      style: TextStyle(
                        color: Colors.red
                      )
                    ),
                  
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

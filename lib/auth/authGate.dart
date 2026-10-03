import 'package:flutter/material.dart';
import 'package:homie/pages/HomePage.dart';
import 'package:homie/pages/Login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthFate extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: ((context, snapshot) {
        final session  = snapshot.data?.session;
        if(session != null){
          return const LoginPage();
        }else{
          return const HomePage();
        }
      }),
    );
  }
}
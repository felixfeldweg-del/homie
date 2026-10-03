import 'package:flutter/material.dart';
import 'package:homie/auth/auth_gate.dart';
import 'package:homie/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    publishableKey: "sb_publishable_gcU8lqsirTxdPAdB8oZCMw_Q9vuqaka",
    url: "https://kjmhicuttnhjjytgnkrw.supabase.co",
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(), 
      child: MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthGate());
  }
}

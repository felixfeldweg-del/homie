import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    publishableKey: "sb_publishable_gcU8lqsirTxdPAdB8oZCMw_Q9vuqaka",
    url: "https://kjmhicuttnhjjytgnkrw.supabase.co"
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}

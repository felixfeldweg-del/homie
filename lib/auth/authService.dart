import 'package:supabase_flutter/supabase_flutter.dart';

class Authservice {
  final _supabaseClient = Supabase.instance.client;

  User? get currentUser => _supabaseClient.auth.currentUser;

  Stream<AuthState> get authStateChange => _supabaseClient.auth.onAuthStateChange;

  Future<void> login(String email, String password) async {
    await _supabaseClient.auth.signInWithPassword(
      email: email.trim(),
      password: password
      );
  }

  Future<void> logout() async {
    await _supabaseClient.auth.signOut();
  }
}
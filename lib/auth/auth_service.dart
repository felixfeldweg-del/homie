import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends ChangeNotifier {
  final _supabaseClient = Supabase.instance.client;

  StreamSubscription<AuthState>? _authSubscription;

  Session? _session;
  User? _user;

  String? _errorMessage;

  Session? get currentSession => _session;
  User? get currentUser => _user;

  bool get isLoggedIn => _session != null;
  String? get errorMessage => _errorMessage;

  AuthService() {
    _session = _supabaseClient.auth.currentSession;
    _user = _supabaseClient.auth.currentUser;

    _authSubscription = _supabaseClient.auth.onAuthStateChange.listen((data) {
      _session = data.session;
      _user = data.session?.user;

      notifyListeners();
    });
    print("initializing");
  }

  Future<void> login(String email, String password) async {
    try{
      _errorMessage = null;
      await _supabaseClient.auth.signInWithPassword(
        email: email.trim(),
        password: password,
      );
    } on AuthException catch(e) {
      _errorMessage = e.message;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _supabaseClient.auth.signOut();
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}

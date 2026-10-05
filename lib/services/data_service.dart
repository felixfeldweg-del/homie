import 'package:supabase_flutter/supabase_flutter.dart';

class ClassService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  
  Future<List<Map<String, dynamic>>> getUsersClasses() async {
    final data = await _supabaseClient
        .from('classes')
        .select('id, name');

    return List<Map<String, dynamic>>.from(data);
  }

  Future<List<Map<String, dynamic>>> getSubjects() async {
    final data = await _supabaseClient
        .from('subjects')
        .select('id, name');

    return List<Map<String, dynamic>>.from(data);
  }
}
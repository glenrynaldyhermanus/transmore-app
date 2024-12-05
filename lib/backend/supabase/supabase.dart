import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

String _kSupabaseUrl = 'https://rnnccmlwjegflurgwboy.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJubmNjbWx3amVnZmx1cmd3Ym95Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk1OTI5NDIsImV4cCI6MjA0NTE2ODk0Mn0.y5w8BZs1mGWitA64GVlCPY-WN3qAcS2QOMpzQWN1Z5Y';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}

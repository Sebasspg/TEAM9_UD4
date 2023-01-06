import 'package:supabase_flutter/supabase_flutter.dart';

class UsuarioDataService {
  final SupabaseClient usuario = SupabaseClient(
      'ezwalmhqmrrhyrynmrjs.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV6d2FsbWhxbXJyaHlyeW5tcmpzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMzcwMzQsImV4cCI6MTk4NjYxMzAzNH0.koBQyi-cXpwq5o3GfU20l75xBqeQN5b_37LHlcTYkaY');

  //Obtener Informacion
  Future getUsuarios() async {
    try {
      final response = await usuario.from('usuarios').select();

      final data = response;
      return data;
    } catch (e) {
      print(e.toString());
    }
  }
}

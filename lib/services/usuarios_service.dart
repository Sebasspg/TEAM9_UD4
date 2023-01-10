import 'package:supabase_flutter/supabase_flutter.dart';

class UsuarioDataService {
  final SupabaseClient usuario = SupabaseClient(
      'https://ezwalmhqmrrhyrynmrjs.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV6d2FsbWhxbXJyaHlyeW5tcmpzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMzcwMzQsImV4cCI6MTk4NjYxMzAzNH0.koBQyi-cXpwq5o3GfU20l75xBqeQN5b_37LHlcTYkaY');

  //Obtener Informacion x uuid
  Future getUsuarios(String uid) async {
    try {
      final response = await usuario.from('usuarios').select().eq('uuid', uid);
      final data = response;
      print(data);
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  //Actualizar informacion x uuid
  Future updateUsuarios(String uid, String nombre, String edad, String genero,
      String peso, String altura, String tipo_sangre) async {
    try {
      final response = await usuario.from('usuarios').update({
        'nombre': nombre,
        'edad': edad,
        'genero': genero,
        //'image': image,
        'peso': peso,
        'altura': altura,
        'tipo_sangre': tipo_sangre,
      }).eq('uuid', uid);
      final data = response;
      return data;
    } catch (r) {
      print(r.toString());
    }
  }
}

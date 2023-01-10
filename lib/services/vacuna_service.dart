import 'package:supabase_flutter/supabase_flutter.dart';

class VacunaService {
  final SupabaseClient cliente = SupabaseClient(
      'https://ezwalmhqmrrhyrynmrjs.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV6d2FsbWhxbXJyaHlyeW5tcmpzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMzcwMzQsImV4cCI6MTk4NjYxMzAzNH0.koBQyi-cXpwq5o3GfU20l75xBqeQN5b_37LHlcTYkaY');

//Traer datos de vacuno x usuario
  Future getVacunas(String uid) async {
    try {
      final response = await cliente.from('vacunas').select().eq('uuid', uid);
      final data = response;
      print('services--userrs--vacunas');
      print(data);
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  //insertar datos vacunas x uuid
  Future createVacuna(
      String uid, String nombre, String fecha, String duracion) async {
    try {
      final response = await cliente.from('vacunas').insert({
        'nombre': nombre,
        'fecha': fecha,
        'duracion': duracion,
        'uuid': uid
      }).eq('uuid', uid);
      final data = response;
      print('services--vacunas--insert');
      print(data);
      return data;
    } catch (r) {
      print(r.toString());
    }
  }

  //actualizar vacunas x uuid
  Future updateVacuna(String uid) async {
    try {
      final response = await cliente.from('vacunas').update({
        'nombre': 'aaa',
        'fecha': '20/01/2020',
        'duracion': '',
        'uuid': ''
      }).eq('uuid', uid);
      final data = response;
      print('services--vacunas--insert');
      print(data);
      return data;
    } catch (r) {
      print(r.toString());
    }
  }

  Future DeleteVacuna(String id_vacuna) async {
    try {
      final response =
          await cliente.from('vacunas').delete().eq('id', id_vacuna);
      final data = response;
      print('services--vacunas--insert');
      print(data);
      return data;
    } catch (r) {
      print(r.toString());
    }
  }

  Future BorrarTodoVacuna(String uuid) async {
    try {
      final response = await cliente.from('vacunas').delete().eq('uuid', uuid);
      final data = response;
      print('services--vacunas--insert');
      print(data);
      return data;
    } catch (r) {
      print(r.toString());
    }
  }
}

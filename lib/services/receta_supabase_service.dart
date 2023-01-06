import 'package:supabase_flutter/supabase_flutter.dart';

class UsuarioDataService {
//STORAGE
  final SupabaseClient client = SupabaseClient(
      'https://rwbskzkchsmilqhonvxm.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3YnNremtjaHNtaWxxaG9udnhtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMzY5ODMsImV4cCI6MTk4NjYxMjk4M30.34k694v3RZSw2LyltHh01W_M0us8Q4fcKUwHaZxOjj0');
  //bd api supabase
  final String baseUrl =
      'https://rwbskzkchsmilqhonvxm.supabase.co/rest/v1/categoria?select=*';
  final String keyDB =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3YnNremtjaHNtaWxxaG9udnhtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMzY5ODMsImV4cCI6MTk4NjYxMjk4M30.34k694v3RZSw2LyltHh01W_M0us8Q4fcKUwHaZxOjj0';
  final String autization =
      ' Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3YnNremtjaHNtaWxxaG9udnhtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMzY5ODMsImV4cCI6MTk4NjYxMjk4M30.34k694v3RZSw2LyltHh01W_M0us8Q4fcKUwHaZxOjj0';

  //listar recetas
  Future getReceta() async {
    try {
      final response = await client.from('receta').select();

      final data = response;
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  //Listar las recetas por categorias
  Future getRecetaxCategoria(String id) async {
    try {
      final response =
          await client.from('receta').select().eq('id_categoria', id);
      final data = response;
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

//Listar las recetas por valornutricional
  Future getRecetaxValorNutri(int id) async {
    try {
      final response = await client.from('receta').select('''
                  valornutri:id_nutricional(*)
                  ''').eq('id', id);

      final data = response;
      print('services---');
      print(data);
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  //Listar categorias
  Future getCategoria() async {
    try {
      final response = await client.from('categoria').select();
      final data = response;
      return data;
    } catch (e) {
      print(e.toString());
    }
  }
}

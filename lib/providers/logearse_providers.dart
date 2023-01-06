import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:team9_ud3_project/preferences/logearse_preferences.dart';

class AuthService extends ChangeNotifier {
  final String urlbase =
      'https://ezwalmhqmrrhyrynmrjs.supabase.co/rest/v1/usuarios';
  final String _baseUrl = 'ezwalmhqmrrhyrynmrjs.supabase.co';
  final String _apikey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV6d2FsbWhxbXJyaHlyeW5tcmpzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMzcwMzQsImV4cCI6MTk4NjYxMzAzNH0.koBQyi-cXpwq5o3GfU20l75xBqeQN5b_37LHlcTYkaY';
  final String autorization =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV6d2FsbWhxbXJyaHlyeW5tcmpzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMzcwMzQsImV4cCI6MTk4NjYxMzAzNH0.koBQyi-cXpwq5o3GfU20l75xBqeQN5b_37LHlcTYkaY';

  //REGISTRAR NUEVO USUARIO
  Future<String?> crearUsuario(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(_baseUrl, '/auth/v1/signup', {'apikey': _apikey});
    final response = await http.post(url, body: json.encode(authData));
    print(response);

    final Map<String, dynamic> decodeResponse = json.decode(response.body);
    print(decodeResponse.containsKey('id'));
    if (decodeResponse.containsKey('id')) {
      Preferences.identificador = decodeResponse["id"];
      crearDataUser(decodeResponse["id"], email);
      return null;
    } else {
      return "error";
    }
  }

  //LOGIN
  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(_baseUrl, '/auth/v1/token',
        {'grant_type': 'password', 'apikey': _apikey});
    final response = await http.post(url, body: json.encode(authData));
    final decodeResponse = json.decode(response.body);

    print(decodeResponse);

    if (decodeResponse.containsKey('access_token')) {
      Preferences.identificador = decodeResponse["user"]["id"];
      Preferences.token = decodeResponse['access_token'];
      return null;
    } else {
      return "error";
    }
  }

  //TRAER DATOS DEL USUARIO
  Future traerDataUser() async {
    final url = Uri.parse('$urlbase?uuid=eq.${Preferences.identificador}');

    Map<String, String> header = {
      'apikey': _apikey,
      'Authorization': autorization,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };

    final response = await http.get(url, headers: header);
    final decodeResponse = json.decode(response.body)[0];

    return decodeResponse;
  }

  //CREAR DATOS DEL USUARIO
  Future crearDataUser(String uuid, String email) async {
    final url = Uri.parse(urlbase);
    final String msg;

    Map<String, String> header = {
      'apikey': _apikey,
      'Authorization': autorization,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };

    final body = jsonEncode({
      "uuid": uuid,
      "email": email,
    });

    final response = await http.post(url, body: body, headers: header);
    print(response.statusCode);
    if (response.statusCode != 201) {
      msg = 'MSG=> NO SE GUARDO CORRECTAMENTE';
    } else {
      msg = 'MSG=> SE GUARDO CORRECTAMENTE';
    }
    return msg;
  }

  //CERRAR SESION
  Future cerrarSesion() async {
    Preferences.token = "";
    return;
  }

  //VERIFICAR TOKEN
  Future<String> leerToken() async {
    return Preferences.token;
  }

  //Actualizar datos
  Future<String> ActualizarDatitos(String nombre) async {
    final url = Uri.parse('$urlbase?uuid=eq.${Preferences.identificador}');
    final String msg;

    Map<String, String> header = {
      'apikey': _apikey,
      'Authorization': autorization,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };

    final body = jsonEncode({
      'nombre': nombre != '' ? null : nombre,
      // 'idVacuna':idVacuna ,
      // 'idMedicacion':idMedicacion ,
      // 'idAlergia':idAlergia ,
      // 'edad':edad ,
      // 'genero':genero ,
      // 'image':image ,
      // 'peso':peso ,
      // 'altura':altura ,
      // 'tipoSangre':tipoSangre ,
    });
    final response = await http.patch(url, body: body, headers: header);

    if (response.statusCode != 204) {
      msg = 'MSG=> NO SE GUARDO CORRECTAMENTE';
    } else {
      msg = 'MSG=> SE GUARDO CORRECTAMENTE';
    }
    return msg;
  }
}

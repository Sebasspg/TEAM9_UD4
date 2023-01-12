import 'dart:io';

import 'package:flutter/material.dart';
import 'package:team9_ud3_project/model/usuarios_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:team9_ud3_project/services/usuarios_service.dart';

class UsuarioProvider extends ChangeNotifier {
  final UsuarioDataService _dataBaseService = new UsuarioDataService();

  File? image;
  String? nameImg;

  String edadlocal = "-";
  String tipo_sangrelocal = "-";
  String nombrelocal = "-";
  String alturalocal = "-";
  String pesolocal = "0";
  String imagenlocal = "";

  final SupabaseClient client = SupabaseClient(
      'https://ezwalmhqmrrhyrynmrjs.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV6d2FsbWhxbXJyaHlyeW5tcmpzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMzcwMzQsImV4cCI6MTk4NjYxMzAzNH0.koBQyi-cXpwq5o3GfU20l75xBqeQN5b_37LHlcTYkaY');

  //listar user por uuid
  Future getusuario(String uid) async {
    List<dynamic> data = await _dataBaseService.getUsuarios(uid);
    datosLocales(data);
    print('get-userrs-providers');
    return data.map((userElement) => Users.fromMap(userElement)).toList();
  }

  void datosLocales(List<dynamic> data) {
    nombrelocal = data[0]["nombre"];
    alturalocal = data[0]["altura"];
    edadlocal = data[0]["edad"];
    tipo_sangrelocal = data[0]["tipo_sangre"];
    pesolocal = data[0]["peso"];
    imagenlocal = data[0]["image"];
    notifyListeners();
  }

  //act usuario por uuid
  Future uptusuario(String uid, String nombre, String edad, String genero,
      String peso, String altura, String tipo_sangre) async {
    await _dataBaseService.updateUsuarios(
        uid, nombre, edad, genero, nameImg!, peso, altura, tipo_sangre);

    notifyListeners();
  }

  //storage
//SAVE IMAGE IN STORAGE
  Future subirImgStorage() async {
    final file = File(image!.path);

    final ruta0 = '/data/user/0/com.example.team9_ud3_project/cache/$nameImg';

    final ruta1 = image!.path
        .replaceAll('/data/user/0/com.example.team9_ud3_project/cache', 'img');

    final ruta2 = image!.path.replaceAll(
        '/data/user/0/com.example.team9_ud3_project/app_flutter', 'img');

    final newPaht = (image!.path == ruta0) ? ruta1 : ruta2;

    final response = await client.storage.from('images').upload(newPaht, file);
    print(response);
    notifyListeners();
  }

  //Gallery
  Future activeGalleryImg() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemp = File(image.path);

    nameImg = image.name;
    this.image = imageTemp;
    notifyListeners();
  }
}

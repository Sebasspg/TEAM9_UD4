import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

class LauncherProvider extends ChangeNotifier {
  bool isVisible = false;

  //MENU
  void activeMenu() {
    (isVisible == false) ? (isVisible = true) : (isVisible = false);
    notifyListeners();
  }

  //MAP
  void goMapLauncher() async {
    String url = 'https://goo.gl/maps/u4t8yCzaBz9eDaJp7';
    String urlEncode = Uri.encodeFull(url);

    if (await canLaunchUrlString(urlEncode)) {
      await launchUrlString(urlEncode, mode: LaunchMode.externalApplication);
    }
  }

  //CORREO
  void goEmailLauncher() async {
    String email = 'cube3@gmail.com';
    String subject = 'Regalos Navidad';
    String msg = 'Tu regalo esta en camino';

    String urlEncode =
        Uri.encodeFull('mailto:$email?subject=$subject&body=$msg');
    if (await canLaunchUrlString(urlEncode)) {
      await launchUrlString(urlEncode, mode: LaunchMode.externalApplication);
    }
  }

  //Browser

  void goBrowserLauncher() async {
    String url = 'https://drive.google.com/file/d/1VnAUQJ1vOEgYyQRzib5p-g4hH-hpZgcH/view?usp=sharing';
    String urlEncode = Uri.encodeFull(url);
    if (await canLaunchUrlString(urlEncode)) {
      await launchUrlString(urlEncode, mode: LaunchMode.externalApplication);
    }
  }

  //Phone
  void goPhoneLauncher() async {
    String phone = '+51987654231';
    String url = 'tel:$phone';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }

  void goWahtsappLauncher() async {
    String phone = '+51987654231';
    String msg = 'Feliz Navidad';
    String urlEncode = Uri.encodeFull('https://wa.me/$phone?text=$msg');
    if (await canLaunchUrlString(urlEncode)) {
      await launchUrlString(urlEncode, mode: LaunchMode.externalApplication);
    }
  }

  void goYoutubeEjercicio(String direccion) async {
    String url = direccion;
    String urlEncode = Uri.encodeFull(url);
    if (await canLaunchUrlString(urlEncode)) {
      await launchUrlString(urlEncode, mode: LaunchMode.externalApplication);
    }
  }
}

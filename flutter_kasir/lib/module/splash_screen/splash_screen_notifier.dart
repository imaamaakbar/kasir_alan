import 'package:flutter/material.dart';
import 'package:flutter_kasir/module/create_%20menu/create_menu_page.dart';
import 'package:flutter_kasir/module/menu_utama/menu_utama_page.dart';

class SplashScreenNotifier extends ChangeNotifier {
  final BuildContext context;
  String? namaRoutes;
  SplashScreenNotifier(this.context) {
    init();
  }

  init() async {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      namaRoutes = ModalRoute.of(context)!.settings.name;
      notifyListeners();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  namaRoutes == "/tambah" ? CreateMenuPage() : MenuPage()),
          (route) => false);
      // : Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => const LoginPage()),
      //     (route) => false);
    });
    notifyListeners();
  }
}

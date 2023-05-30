import 'dart:js_interop';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kasir/models/index.dart';
import 'package:flutter_kasir/models/menu_model.dart';
import 'package:flutter_kasir/network/network.dart';
import 'package:flutter_kasir/repository/menu_repository.dart';

class MenuNotifier extends ChangeNotifier {
  final BuildContext context;

  MenuNotifier(this.context) {
    getMenu();

    notifyListeners();
  }

  List<MenuModel> listMenu = [];
  List<BelanjaModel> listBelanja = [];
  TextEditingController uangPembeli = TextEditingController();
  int uangKembalian = 0;
  int total = 0;
  Future getMenu() async {
    MenuRepository.getMenu(NetworkURL.getMenu()).then((value) {
      if (value['code'] == 200) {
        for (Map<String, dynamic> i in value['data']) {
          listMenu.add(MenuModel.fromJson(i));
        }
        notifyListeners();
      }
    });
  }

  hitungKembalian() {
    total = listBelanja.map((e) => int.parse(e.harga) * e.jumlah!).toList().sum;

    notifyListeners();
    print(int.parse(uangPembeli.text.trim()));
    print(total);
    uangKembalian = int.parse(uangPembeli.text.trim()) - total;
    notifyListeners();
  }

  belanja(String namaMenu, String harga) {
    int isAda =
        listBelanja.indexWhere((element) => element.namaMenu == namaMenu);
    print(namaMenu);
    print(harga);
    print(isAda);
    notifyListeners();

    if (isAda == -1) {
      listBelanja
          .add(BelanjaModel(namaMenu: namaMenu, jumlah: 1, harga: harga));
      notifyListeners();
    } else {
      listBelanja[isAda].jumlah = listBelanja[isAda].jumlah! + 1;
      notifyListeners();
    }

    notifyListeners();
  }
}

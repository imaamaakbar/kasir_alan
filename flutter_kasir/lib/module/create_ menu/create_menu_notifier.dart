import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kasir/models/menu_model.dart';
import 'package:flutter_kasir/module/create_%20menu/cretae_menu_widget.dart';
import 'package:flutter_kasir/network/network.dart';
import 'package:flutter_kasir/repository/menu_repository.dart';

class CreateMenuNotifier extends ChangeNotifier {
  final BuildContext context;

  CreateMenuNotifier(this.context) {
    getMenu();
  }
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController namaMenu = TextEditingController();
  TextEditingController harga = TextEditingController();
  String? pilihanJenis;
  TextEditingController gambar = TextEditingController();
  TextEditingController nama_gambar = TextEditingController();
  List<MenuModel> listMenu = [];
  int drawer = 1;
  int idMenu = 0;
  Future getMenu() async {
    listMenu.clear();
    MenuRepository.getMenu(NetworkURL.getMenu()).then((value) {
      if (value['code'] == 200) {
        for (Map<String, dynamic> i in value['data']) {
          listMenu.add(MenuModel.fromJson(i));
        }
        notifyListeners();
      }
    });
  }

  List<PlatformFile>? paths;
  List<int>? file;
  // String? fileName;

  tambahForm() {
    drawer = 1;
    namaMenu.clear();
    pilihanJenis = null;
    harga.clear();
    // file?.clear();
    gambar.clear();

    notifyListeners();

    keyScaffold.currentState!.openEndDrawer();
  }

  updateForm(MenuModel data) {
    drawer = 2;
    idMenu = int.parse(data.id);
    namaMenu = TextEditingController(text: data.namaMenu);
    pilihanJenis = data.jenisMenu;
    harga = TextEditingController(text: data.harga);
    nama_gambar = TextEditingController(text: data.images);
    gambar.clear();
    notifyListeners();
    keyScaffold.currentState!.openEndDrawer();
  }

  Future updateMenu() async {
    if (keyForm.currentState!.validate()) {
      showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.white,
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: const Text("Sedang diproses..."),
            );
          });
      MenuRepository.updateMenu(
              NetworkURL.updateMenu(),
              idMenu,
              namaMenu.text.trim(),
              pilihanJenis!,
              harga.text.trim(),
              file,
              gambar.text.trim())
          .then((value) {
        if (value['code'] == 200) {
          getMenu();
          Navigator.pop(context);
          showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${value['message']}"),
                      const SizedBox(
                        height: 16,
                      ),
                      FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Oke"),
                      )
                    ],
                  ),
                );
              });
        } else {
          Navigator.pop(context);
          showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${value['message']}"),
                      const SizedBox(
                        height: 16,
                      ),
                      FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Oke"),
                      )
                    ],
                  ),
                );
              });
          print("gagal");
        }
      });
    }
  }

  Future deleteMenu() async {
    showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        backgroundColor: Colors.white,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: const Text("Sedang diproses..."),
          );
        });
    MenuRepository.deleteMenu(
      NetworkURL.deleteMenu(),
      idMenu,
    ).then((value) {
      if (value['code'] == 200) {
        getMenu();

        Navigator.pop(context);
        showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${value['message']}"),
                    const SizedBox(
                      height: 16,
                    ),
                    FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Oke"),
                    )
                  ],
                ),
              );
            });
      } else {
        Navigator.pop(context);
        showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${value['message']}"),
                    const SizedBox(
                      height: 16,
                    ),
                    FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Oke"),
                    )
                  ],
                ),
              );
            });
        print("gagal");
      }
    });
  }

  filepick() async {
    paths = (await FilePickerWeb.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    ))
        ?.files;

    if (paths != null) {
      file = paths!.first.bytes!;
      gambar = TextEditingController(text: paths!.first.name);
      notifyListeners();
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }

  gantiPilihan(String? data) {
    pilihanJenis = data;
    notifyListeners();
  }

  Future createMenu() async {
    if (keyForm.currentState!.validate()) {
      showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.white,
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: const Text("Sedang diproses..."),
            );
          });
      MenuRepository.createMenu(NetworkURL.createMenu(), namaMenu.text.trim(),
              pilihanJenis!, harga.text.trim(), file, gambar.text.trim())
          .then((value) {
        if (value['code'] == 200) {
          getMenu();
          Navigator.pop(context);
          showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${value['message']}"),
                      const SizedBox(
                        height: 16,
                      ),
                      FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Oke"),
                      )
                    ],
                  ),
                );
              });
        } else {
          Navigator.pop(context);
          showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${value['message']}"),
                      const SizedBox(
                        height: 16,
                      ),
                      FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Oke"),
                      )
                    ],
                  ),
                );
              });
        }
      });
    }
  }
}

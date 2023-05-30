import 'package:flutter/material.dart';
import 'package:flutter_kasir/module/create_%20menu/create_menu_notifier.dart';

class TambahMenu extends StatelessWidget {
  final CreateMenuNotifier value;
  const TambahMenu({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tambah Data Menu",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 16,
        ),
        Form(
            key: value.keyForm,
            child: Column(
              children: [
                TextFormField(
                  controller: value.namaMenu,
                  decoration: InputDecoration(labelText: "Nama Makanan"),
                  validator: (er) {
                    if (er != null) {
                      return null;
                    } else {
                      return "Wajib Isi!";
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                DropdownButtonFormField(
                    value: value.pilihanJenis,
                    items: ['Cumi', 'Sayuran', 'Udang', 'Happy Hour']
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Container(
                                child: Text(
                                  e,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (e) {
                      value.gantiPilihan(e);
                    },
                    validator: (er) {
                      if (er != null) {
                        return null;
                      } else {
                        return "Wajib Isi!";
                      }
                    },
                    decoration: InputDecoration(labelText: "Jenis Makanan")),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: value.harga,
                  decoration: InputDecoration(labelText: "Harga"),
                  validator: (er) {
                    if (er != null) {
                      return null;
                    } else {
                      return "Wajib Isi!";
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  child: TextFormField(
                    controller: value.gambar,
                    decoration: InputDecoration(labelText: "Gambar"),
                    validator: (er) {
                      if (er != null) {
                        return null;
                      } else {
                        return "Wajib Isi!";
                      }
                    },
                    enabled: false,
                  ),
                  onTap: () => value.filepick(),
                ),
                SizedBox(
                  height: 12,
                ),
                FilledButton(
                  onPressed: () {
                    value.createMenu();
                  },
                  child: Text("Tambah"),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(300, 50))),
                )
              ],
            ))
      ],
    );
  }
}

class UpdateMenu extends StatelessWidget {
  final CreateMenuNotifier value;
  const UpdateMenu({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Update Data Menu",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 16,
        ),
        Form(
            key: value.keyForm,
            child: Column(
              children: [
                TextFormField(
                  controller: value.namaMenu,
                  decoration: InputDecoration(labelText: "Nama Makanan"),
                  validator: (er) {
                    if (er != null) {
                      return null;
                    } else {
                      return "Wajib Isi!";
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                DropdownButtonFormField(
                    value: value.pilihanJenis,
                    items: ['Cumi', 'Sayuran', 'Udang', 'Happy Hour']
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Container(
                                child: Text(
                                  e,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (e) {
                      value.gantiPilihan(e);
                    },
                    validator: (er) {
                      if (er != null) {
                        return null;
                      } else {
                        return "Wajib Isi!";
                      }
                    },
                    decoration: InputDecoration(labelText: "Jenis Makanan")),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: value.harga,
                  decoration: InputDecoration(labelText: "Harga"),
                  validator: (er) {
                    if (er != null) {
                      return null;
                    } else {
                      return "Wajib Isi!";
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  child: TextFormField(
                    controller: value.gambar.text == ""
                        ? value.nama_gambar
                        : value.gambar,
                    decoration: InputDecoration(labelText: "Gambar"),
                    enabled: false,
                  ),
                  onTap: () => value.filepick(),
                ),
                SizedBox(
                  height: 12,
                ),
                FilledButton(
                  onPressed: () {
                    value.updateMenu();
                  },
                  child: Text("Update"),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(300, 50))),
                ),
                SizedBox(
                  height: 12,
                ),
                FilledButton(
                  onPressed: () {
                    value.deleteMenu();
                  },
                  child: Text("Delete"),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(300, 50))),
                )
              ],
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_kasir/module/create_%20menu/create_menu_notifier.dart';
import 'package:flutter_kasir/module/create_%20menu/cretae_menu_widget.dart';
import 'package:flutter_kasir/module/menu_utama/menu_utama_page.dart';
import 'package:flutter_kasir/network/network.dart';
import 'package:provider/provider.dart';

class CreateMenuPage extends StatelessWidget {
  const CreateMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateMenuNotifier(context),
      child: Consumer<CreateMenuNotifier>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: const Color.fromARGB(31, 172, 164, 164),
          key: value.keyScaffold,
          endDrawer: Drawer(
            width: 500,
            child: SizedBox(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: value.drawer == 1
                        ? TambahMenu(value: value)
                        : UpdateMenu(value: value))),
          ),
          body: ListView(children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()))
                          },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                  Text(
                    "Kembali",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: FilledButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(200, 50))),
                      onPressed: () {
                        value.tambahForm();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text("Tambah"),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 500,
              child: Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(blurRadius: 5, color: Colors.black38)
                    ]),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: value.listMenu
                        .map((e) => Container(
                            margin: EdgeInsets.all(16),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.5, color: Colors.black12),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                value.updateForm(e);
                              },
                              child: Row(children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                    NetworkURL.getImages(e.images),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.namaMenu,
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        e.jenisMenu,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Rp. ${e.harga}",
                                        style: TextStyle(
                                          fontSize: 24,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            )))
                        .toList(),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

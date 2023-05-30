import 'package:flutter/material.dart';
import 'package:flutter_kasir/module/menu_utama/menu_utama_notifier.dart';
import 'package:flutter_kasir/network/network.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuNotifier(context),
      child: Consumer<MenuNotifier>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.black12,
          body: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.63,
                      child: ListView(
                        children: [
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: value.listMenu
                                      .where((element) =>
                                          element.jenisMenu == "Cumi")
                                      .map((e) => InkWell(
                                            onTap: () => value.belanja(
                                                e.namaMenu, e.harga),
                                            child: SizedBox(
                                              height: 200,
                                              width: 200,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    border:
                                                        Border.all(width: 1),
                                                    color: Colors.white),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Image.network(
                                                      NetworkURL.getImages(
                                                          e.images),
                                                      height: 170,
                                                      width: 180,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Center(
                                                      child: Text(e.namaMenu),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 200,
                                width: 200,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: Colors.white),
                                  child: Center(child: Text("Cumi")),
                                ))
                          ]),
                          SizedBox(
                            height: 16,
                          ),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: value.listMenu
                                      .where((element) =>
                                          element.jenisMenu == "Sayuran")
                                      .map(
                                        (e) => InkWell(
                                            onTap: () => value.belanja(
                                                e.namaMenu, e.harga),
                                            child: SizedBox(
                                              height: 200,
                                              width: 200,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    border:
                                                        Border.all(width: 1),
                                                    color: Colors.white),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Image.network(
                                                      NetworkURL.getImages(
                                                          e.images),
                                                      height: 170,
                                                      width: 180,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Center(
                                                      child: Text(e.namaMenu),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                                height: 200,
                                width: 200,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: Colors.white),
                                  child: Center(child: Text("Sayuran")),
                                ))
                          ]),
                          SizedBox(
                            height: 16,
                          ),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: value.listMenu
                                      .where((element) =>
                                          element.jenisMenu == "Udang")
                                      .map(
                                        (e) => InkWell(
                                            onTap: () => value.belanja(
                                                e.namaMenu, e.harga),
                                            child: SizedBox(
                                              height: 200,
                                              width: 200,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    border:
                                                        Border.all(width: 1),
                                                    color: Colors.white),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Image.network(
                                                      NetworkURL.getImages(
                                                          e.images),
                                                      height: 170,
                                                      width: 180,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Center(
                                                      child: Text(e.namaMenu),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 200,
                                width: 200,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: Colors.white),
                                  child: Center(child: Text("Udang")),
                                ))
                          ]),
                          SizedBox(
                            height: 16,
                          ),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: value.listMenu
                                      .where((element) =>
                                          element.jenisMenu == "Happy Hour")
                                      .map(
                                        (e) => InkWell(
                                            onTap: () => value.belanja(
                                                e.namaMenu, e.harga),
                                            child: SizedBox(
                                              height: 200,
                                              width: 200,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    border:
                                                        Border.all(width: 1),
                                                    color: Colors.white),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Image.network(
                                                      NetworkURL.getImages(
                                                          e.images),
                                                      height: 170,
                                                      width: 180,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Center(
                                                      child: Text(e.namaMenu),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 200,
                                width: 200,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: Colors.white),
                                  child: Center(child: Text("Happy Hour")),
                                ))
                          ]),
                        ],
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: 60,
                                        child: Container(
                                          color: Colors.blue.shade100,
                                          child: Column(children: [
                                            Icon(
                                              Icons.people_alt,
                                              size: 36,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              "Users",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            )
                                          ]),
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "New Customer",
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        height: 60,
                                        width: 60,
                                        child: Container(
                                          color: Colors.blue.shade100,
                                          child: Column(children: [
                                            Icon(
                                              Icons.list_alt_rounded,
                                              size: 36,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              "Bill's List",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Dine in"),
                                          Icon(Icons.keyboard_arrow_down_sharp)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 310,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "1",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                              Spacer(),
                                              Text(
                                                "View Table",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Column(
                                              children: value.listBelanja
                                                  .map((e) => Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(e.namaMenu),
                                                          Spacer(),
                                                          e.jumlah! > 1
                                                              ? Text(
                                                                  "x ${e.jumlah}")
                                                              : SizedBox(),
                                                          SizedBox(
                                                            width: 15,
                                                          ),
                                                          Text(
                                                              'Rp. ${e.jumlah! * int.parse(e.harga)}')
                                                        ],
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Sub Total : ",
                                              ),
                                              Spacer(),
                                              Text(
                                                  "Rp. ${(value.listBelanja.map((e) => int.parse(e.harga) * e.jumlah!).toList().sum)}")
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Total : ",
                                              ),
                                              Spacer(),
                                              Text(
                                                  "Rp. ${(value.listBelanja.map((e) => int.parse(e.harga) * e.jumlah!).toList().sum)}")
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text("Clear Sale"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showDialog<void>(
                                                context: context,
                                                barrierDismissible:
                                                    false, // user must tap button!
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title:
                                                        const Text('Informasi'),
                                                    content:
                                                        const SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          Text(
                                                              'Bill ini telah tersimpan...'),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child:
                                                            const Text('Oke'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: SizedBox(
                                              width: 200,
                                              child: Container(
                                                color: Color.fromARGB(
                                                    66, 146, 144, 144),
                                                child: Center(
                                                  child: Text(
                                                    "Save Bill",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            child: SizedBox(
                                              width: 200,
                                              child: Container(
                                                color: Color.fromARGB(
                                                    66, 146, 144, 144),
                                                child: Center(
                                                  child: Text(
                                                    "Print Bill",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              showDialog<void>(
                                                context: context,
                                                barrierDismissible:
                                                    false, // user must tap button!
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text('Print'),
                                                    content:
                                                        const SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          Text(
                                                              'Silahkan Pilih Print dibawah ini....'),
                                                          Text(
                                                            'Under Contruction....',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black12),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child:
                                                            const Text('Oke'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Container(
                                      color: Colors.blueAccent.shade700,
                                      child: Row(children: [
                                        SizedBox(
                                          width: 50,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                width: 1,
                                                color: Colors.white,
                                              )),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.splitscreen,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  "Split Bill",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        InkWell(
                                          onTap: () {
                                            showDialog<void>(
                                              context: context,
                                              barrierDismissible:
                                                  false, // user must tap button!
                                              builder: (context) {
                                                return StatefulBuilder(builder:
                                                    ((context, setState) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Total Pembayaran'),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          Text(
                                                            " Rp. ${(value.listBelanja.map((e) => int.parse(e.harga) * e.jumlah!).toList().sum)}",
                                                            style: TextStyle(
                                                                fontSize: 24,
                                                                color: Colors
                                                                    .black45),
                                                          ),
                                                          TextField(
                                                            controller: value
                                                                .uangPembeli,
                                                            decoration:
                                                                InputDecoration(
                                                                    labelText:
                                                                        "Uang Pembeli"),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      FilledButton(
                                                          onPressed: () {
                                                            value
                                                                .hitungKembalian();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        "Kembalian"),
                                                                    content:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Text(
                                                                        " Rp. ${value.uangKembalian}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                24,
                                                                            color:
                                                                                Colors.black45),
                                                                      ),
                                                                    ),
                                                                    actions: <Widget>[
                                                                      TextButton(
                                                                        child: const Text(
                                                                            'Oke'),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                          child: Text(
                                                              "Hitung Kembalian")),
                                                      TextButton(
                                                        child:
                                                            const Text('Oke'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                }));
                                              },
                                            );
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Change Rp. ${(value.listBelanja.map((e) => int.parse(e.harga) * e.jumlah!).toList().sum)}",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  )
                                ]),
                          )),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

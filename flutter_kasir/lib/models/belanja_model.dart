import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class BelanjaModel {
  BelanjaModel({
    required this.namaMenu,
    this.jumlah,
    required this.harga,
  });

  final String namaMenu;
  int? jumlah;
  final String harga;

  factory BelanjaModel.fromJson(Map<String, dynamic> json) => BelanjaModel(
      namaMenu: json['nama_menu'].toString(),
      jumlah: json['jumlah'] as int,
      harga: json['harga'].toString());

  Map<String, dynamic> toJson() =>
      {'nama_menu': namaMenu, 'jumlah': jumlah, 'harga': harga};

  BelanjaModel clone() =>
      BelanjaModel(namaMenu: namaMenu, jumlah: jumlah, harga: harga);

  BelanjaModel copyWith({String? namaMenu, int? jumlah, String? harga}) =>
      BelanjaModel(
        namaMenu: namaMenu ?? this.namaMenu,
        jumlah: jumlah ?? this.jumlah,
        harga: harga ?? this.harga,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BelanjaModel &&
          namaMenu == other.namaMenu &&
          jumlah == other.jumlah &&
          harga == other.harga;

  @override
  int get hashCode => namaMenu.hashCode ^ jumlah.hashCode ^ harga.hashCode;
}

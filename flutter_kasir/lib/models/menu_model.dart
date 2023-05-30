import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class MenuModel {

  const MenuModel({
    required this.id,
    required this.namaMenu,
    required this.jenisMenu,
    required this.images,
    required this.harga,
  });

  final String id;
  final String namaMenu;
  final String jenisMenu;
  final String images;
  final String harga;

  factory MenuModel.fromJson(Map<String,dynamic> json) => MenuModel(
    id: json['id'].toString(),
    namaMenu: json['nama_menu'].toString(),
    jenisMenu: json['jenis_menu'].toString(),
    images: json['images'].toString(),
    harga: json['harga'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'nama_menu': namaMenu,
    'jenis_menu': jenisMenu,
    'images': images,
    'harga': harga
  };

  MenuModel clone() => MenuModel(
    id: id,
    namaMenu: namaMenu,
    jenisMenu: jenisMenu,
    images: images,
    harga: harga
  );


  MenuModel copyWith({
    String? id,
    String? namaMenu,
    String? jenisMenu,
    String? images,
    String? harga
  }) => MenuModel(
    id: id ?? this.id,
    namaMenu: namaMenu ?? this.namaMenu,
    jenisMenu: jenisMenu ?? this.jenisMenu,
    images: images ?? this.images,
    harga: harga ?? this.harga,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is MenuModel && id == other.id && namaMenu == other.namaMenu && jenisMenu == other.jenisMenu && images == other.images && harga == other.harga;

  @override
  int get hashCode => id.hashCode ^ namaMenu.hashCode ^ jenisMenu.hashCode ^ images.hashCode ^ harga.hashCode;
}

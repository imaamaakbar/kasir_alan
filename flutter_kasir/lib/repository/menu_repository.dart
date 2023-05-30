import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kasir/network/network.dart';

class MenuRepository {
  static Future<dynamic> getMenu(String url) async {
    Dio dio = Dio();

    final response = await dio.get(url);
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA : ${json.encode(response.data)}");
      }

      return jsonDecode(json.encode(response.data));
    } else {
      return jsonDecode(json.encode(response.data));
    }
  }

  static Future<dynamic> createMenu(
    String url,
    String namaMenu,
    String jenisMenu,
    String harga,
    List<int>? image,
    String? fileName,
  ) async {
    Dio dio = Dio();
    FormData formData = FormData.fromMap({
      "nama_menu": namaMenu,
      "jenis_menu": jenisMenu,
      "harga": harga,
      "images": fileName == null
          ? null
          : MultipartFile.fromBytes(image!, filename: fileName),
    });

    final response = await dio.post(
      url,
      data: formData,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return response.data;
    }
  }

  static Future<dynamic> updateMenu(
    String url,
    int id,
    String namaMenu,
    String jenisMenu,
    String harga,
    List<int>? image,
    String? fileName,
  ) async {
    print(url);
    print(id);
    print(namaMenu);
    print(harga);
    // print(fileName);
    Dio dio = Dio();
    FormData formData = FormData.fromMap({
      "id": id,
      "nama_menu": namaMenu,
      "jenis_menu": jenisMenu,
      "harga": harga,
      "images": fileName == ""
          ? ""
          : MultipartFile.fromBytes(image!, filename: fileName),
    });

    final response = await dio.post(
      url,
      data: formData,
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return response.data;
    }
  }

  static Future<dynamic> deleteMenu(String url, int id) async {
    Dio dio = Dio();
    FormData data = FormData.fromMap({'id': id});
    final response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return response.data;
    }
  }
}

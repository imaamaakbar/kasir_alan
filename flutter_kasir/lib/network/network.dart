String url = "http://localhost:8080";
String url_image = "http://localhost:8080/assets/images";

class NetworkURL {
  static String getMenu() {
    return "$url/api/get_menu";
  }

  static String getImages(String image) {
    return "$url_image/$image";
  }

  static String createMenu() {
    return "$url/api/store_menu";
  }

  static String deleteMenu() {
    return "$url/api/delete_menu";
  }

  static String updateMenu() {
    return "$url/api/update_menu";
  }
}

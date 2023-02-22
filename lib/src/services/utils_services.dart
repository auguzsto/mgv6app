class UtilServices {
  String replaceName(String? name) {
    return name!.replaceAll("\$#\$", "").substring(0, 13).trimLeft();
  }
}

import 'package:intl/intl.dart';

class UtilServices {
  String replaceName(String? name) {
    return name!.replaceAll("\$#\$", "").substring(0, 13).trimLeft();
  }

  String replacePrice(double? price) {
    return price!.toString().replaceAll(".", ",");
  }

  String replaceUpdate(String? date) {
    DateFormat format = DateFormat('dd/MM/yyyy HH:mm');

    return format.format(
      DateTime.parse(
        date!.replaceAll("T", " ").substring(0, 16),
      ),
    );
  }
}

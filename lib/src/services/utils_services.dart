import 'package:flutter/material.dart';
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

  String typeItem(int type) {
    if (type != 0) {
      return "Unidade";
    }

    return "Peso";
  }

  Future showAlertType(
      String title, String content, Icon icon, BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: icon,
          title: Text(title),
          content: Container(
            padding: const EdgeInsets.all(8),
            child: Text(content),
          ),
        );
      },
    );
  }
}

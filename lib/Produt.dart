import 'package:dio/dio.dart';
import 'dart:convert';

class Produt {
  //TextEditingController? id = TextEditingController();
  String? id;
  String? name = "ITN_DESCRITIVO";
  String? price = "ITN_PRECO";
  String? status = "ITN_ATIVO";
  String? update = "ITN_DATA";

  Produt(this.id);

  void get({status, price}) async {
    var dio = Dio();
    final fetch =
        await dio.get('http://192.168.0.205:3000/api/pcod/${this.id}');
    var resp = jsonDecode(fetch.data);
    //print(resp['${this.price}'].toString());
    if (price == true) {
      print(resp['${this.price}'].toString());
    }
    if (status == true) {
      if (resp['${this.status}'] == true) {
        print("Ativo");
      }
      if (resp['${this.status}'] == false) {
        print("Desativado");
      }
    }
  }
}

void main() {
  Produt('2').get(price: true, status: true);
}

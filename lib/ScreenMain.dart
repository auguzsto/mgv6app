import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  TextEditingController _id = TextEditingController();
  String _prodId = "0";
  String _prodPreco = "0";
  String _prodDescricao = "Balança";
  String _prodValidade = "0";
  String _prodCarga = "0";
  var _prodAtivo = "Nenhum";
  Future _getId() async {
    var dio = Dio();
    var resp = await dio.get('http://192.168.0.205:3000/api/pcod/${_id.text}');
    var jsonData = jsonDecode(resp.data);
    setState(() {
      _prodId = jsonData['ITN_CODIGO'].toString();
      _prodPreco = jsonData['ITN_PRECO'].toString();
      _prodAtivo = jsonData['ITN_ATIVO'].toString();
      _prodDescricao = jsonData['ITN_DESCRITIVO'].toString();
      _prodCarga = jsonData['ITN_DATA']
          .toString()
          .replaceAll("T", "\n")
          .substring(0, 16);
      if (_prodAtivo == "true") {
        _prodAtivo = "Ativo";
      } else {
        _prodAtivo = "Desativado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_prodDescricao.replaceAll("\$#\$", "")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(11),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Código do produto",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      _prodId,
                      style: TextStyle(color: Colors.white, fontSize: 55),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Estado do produto",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      _prodAtivo,
                      style: TextStyle(color: Colors.white, fontSize: 55),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Preço",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      "R\$${_prodPreco.replaceAll(".", ",")}",
                      style: TextStyle(color: Colors.white, fontSize: 55),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Última alteração",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      _prodCarga,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(22),
                  child: TextField(
                    controller: _id,
                    onSubmitted: (value) {
                      _getId();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite o código do produto",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

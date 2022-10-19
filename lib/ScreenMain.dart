import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'ScreenHome.dart';

class ScreenMain extends StatefulWidget {
  String? _id;
  ScreenMain(this._id, {super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  //TextEditingController _id = TextEditingController();
  String _prodId = "0";
  String _prodPreco = "0";
  String _prodDescricao = "Balança";
  //String _prodValidade = "0";
  String _prodCarga = "0";
  var _prodAtivo = "Nenhum";

  Future<Map> _getId() async {
    var dio = Dio();
    var resp =
        await dio.get('http://192.168.0.205:3000/api/pcod/${widget._id}');
    return jsonDecode(resp.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget._id}"),
        //Text(_prodDescricao.replaceAll("\$#\$", "")),
      ),
      body: FutureBuilder<Map>(
        future: _getId(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            case ConnectionState.done:
              return Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 12, left: 12, right: 8),
                            child: Text(
                              "Descrição do produto",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: Text(
                              snapshot.data!['ITN_DESCRITIVO']
                                  .toString()
                                  .replaceAll("\$#\$", "")
                                  .substring(0, 13)
                                  .trimLeft(),
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 52),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 12, left: 12, right: 8),
                            child: Text(
                              "Preço",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: Text(
                              "R\$ ${snapshot.data!['ITN_PRECO'].toString().replaceAll(".", ",")} KG",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 52),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 12, left: 12, right: 8),
                            child: Text(
                              "Data e hora da última alteração",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: Text(
                              snapshot.data!['ITN_DATA']
                                  .toString()
                                  .replaceAll("T", " ")
                                  .substring(0, 16),
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 52),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10, bottom: 10, top: 10),
                            child: Column(
                              children: [
                                if (snapshot.data!['ITN_ATIVO'] == true) ...[
                                  Column(
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.check,
                                          size: 98,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                          "Esse produto está ativo",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                ] else ...[
                                  Column(
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.error,
                                          size: 98,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                          "Esse produto está desativado",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      )
                                    ],
                                  ),
                                ]
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

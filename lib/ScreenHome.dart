import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:mgv6app/ScreenMain.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  Future _getBalances() async {
    var dio = Dio();
    var resp = await dio.get("http://192.168.0.205:3000/api/balanca/");
    return jsonDecode(resp.data);
  }

  TextEditingController _id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Balança MGV6-PRIX",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ScreenMain(_id.text))));
                },
                controller: _id,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite aqui o código do produto",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 32,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ScreenMain(_id.text))));
                },
                child: Text(
                  "Consultar",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              FutureBuilder(
                future: _getBalances(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text(
                          "Ocorreu um erro na comunicação com o servidor.");
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      );
                    case ConnectionState.done:
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        //decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (snapshot.data![0]['BAL_ESTADO']
                                              .toString() ==
                                          "1") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.blue,
                                          size: 45,
                                        )
                                      ] else if (snapshot.data![0]['BAL_ESTADO']
                                              .toString() ==
                                          "2") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.orange,
                                          size: 45,
                                        ),
                                      ] else ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.red,
                                          size: 45,
                                        ),
                                      ],
                                      Text("01"),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (snapshot.data![1]['BAL_ESTADO']
                                              .toString() ==
                                          "1") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.blue,
                                          size: 45,
                                        )
                                      ] else if (snapshot.data![1]['BAL_ESTADO']
                                              .toString() ==
                                          "2") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.orange,
                                          size: 45,
                                        ),
                                      ] else ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.red,
                                          size: 45,
                                        ),
                                      ],
                                      Text("02"),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (snapshot.data![2]['BAL_ESTADO']
                                              .toString() ==
                                          "1") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.blue,
                                          size: 45,
                                        )
                                      ] else if (snapshot.data![2]['BAL_ESTADO']
                                              .toString() ==
                                          "2") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.orange,
                                          size: 45,
                                        ),
                                      ] else ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.red,
                                          size: 45,
                                        ),
                                      ],
                                      Text("03"),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (snapshot.data![3]['BAL_ESTADO']
                                              .toString() ==
                                          "1") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.blue,
                                          size: 45,
                                        )
                                      ] else if (snapshot.data![3]['BAL_ESTADO']
                                              .toString() ==
                                          "2") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.orange,
                                          size: 45,
                                        ),
                                      ] else ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.red,
                                          size: 45,
                                        ),
                                      ],
                                      Text("04"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (snapshot.data![4]['BAL_ESTADO']
                                              .toString() ==
                                          "1") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.blue,
                                          size: 45,
                                        )
                                      ] else if (snapshot.data![4]['BAL_ESTADO']
                                              .toString() ==
                                          "2") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.orange,
                                          size: 45,
                                        ),
                                      ] else ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.red,
                                          size: 45,
                                        ),
                                      ],
                                      Text("05"),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (snapshot.data![5]['BAL_ESTADO']
                                              .toString() ==
                                          "1") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.blue,
                                          size: 45,
                                        )
                                      ] else if (snapshot.data![5]['BAL_ESTADO']
                                              .toString() ==
                                          "2") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.orange,
                                          size: 45,
                                        ),
                                      ] else ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.red,
                                          size: 45,
                                        ),
                                      ],
                                      Text("06"),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (snapshot.data![6]['BAL_ESTADO']
                                              .toString() ==
                                          "1") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.blue,
                                          size: 45,
                                        )
                                      ] else if (snapshot.data![6]['BAL_ESTADO']
                                              .toString() ==
                                          "2") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.orange,
                                          size: 45,
                                        ),
                                      ] else ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.red,
                                          size: 45,
                                        ),
                                      ],
                                      Text("07"),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (snapshot.data![7]['BAL_ESTADO']
                                              .toString() ==
                                          "1") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.blue,
                                          size: 45,
                                        )
                                      ] else if (snapshot.data![7]['BAL_ESTADO']
                                              .toString() ==
                                          "2") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.orange,
                                          size: 45,
                                        ),
                                      ] else ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.red,
                                          size: 45,
                                        ),
                                      ],
                                      Text("08"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (snapshot.data![8]['BAL_ESTADO']
                                              .toString() ==
                                          "1") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.blue,
                                          size: 45,
                                        )
                                      ] else if (snapshot.data![8]['BAL_ESTADO']
                                              .toString() ==
                                          "2") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.orange,
                                          size: 45,
                                        ),
                                      ] else ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.red,
                                          size: 45,
                                        ),
                                      ],
                                      Text("09"),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (snapshot.data![9]['BAL_ESTADO']
                                              .toString() ==
                                          "1") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.blue,
                                          size: 45,
                                        )
                                      ] else if (snapshot.data![9]['BAL_ESTADO']
                                              .toString() ==
                                          "2") ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.orange,
                                          size: 45,
                                        ),
                                      ] else ...[
                                        Icon(
                                          Icons.signal_wifi_4_bar_outlined,
                                          color: Colors.red,
                                          size: 45,
                                        ),
                                      ],
                                      Text("10"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(""),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration:
                                              BoxDecoration(color: Colors.blue),
                                        ),
                                        Text(" Balança atualizada"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration:
                                              BoxDecoration(color: Colors.red),
                                        ),
                                        Text(" Balança desligada"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              color: Colors.orange),
                                        ),
                                        Text(" Balança desatualizada"),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(18),
            child: Text("Beta 0.06"),
          )
        ],
      ),
    );
  }
}

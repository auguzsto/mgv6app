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
          "Balança MGV6-PIX",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: Text("Beta 0.04"),
          )
        ],
      ),
    );
  }
}

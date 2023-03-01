import 'package:flutter/material.dart';

class NotFoundProduct extends StatelessWidget {
  const NotFoundProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.error,
            color: Colors.red,
            size: 180,
          ),
          Text(
            "Produto não encontrado",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          )
        ],
      ),
    );
  }
}

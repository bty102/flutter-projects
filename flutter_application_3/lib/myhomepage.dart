import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: Text(
            "Xin chao moi nguoi!",
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
        ),
        Icon(Icons.heart_broken, size: 100, color: Colors.red),
        Text("Lop LTDD Nhom 1", style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;
  Color numberColor = Colors.black;
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ứng dụng đếm số"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.blue,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      // margin: EdgeInsets.only(top: 80),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Giá trị hiện tại:", style: TextStyle(fontSize: 20)),
          Text("$count", style: TextStyle(fontSize: 80, color: numberColor)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    count--;
                    Random random = Random();
                    numberColor = colors[random.nextInt(colors.length)];
                  });
                },
                child: Row(
                  spacing: 5,
                  children: [Icon(Icons.remove), Text("Giảm")],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    count = 0;
                    Random random = Random();
                    numberColor = colors[random.nextInt(colors.length)];
                  });
                },
                child: Row(
                  spacing: 5,
                  children: [Icon(Icons.restore), Text("Đặt lại")],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    count++;
                    Random random = Random();
                    numberColor = colors[random.nextInt(colors.length)];
                  });
                },
                child: Row(
                  spacing: 5,
                  children: [Icon(Icons.add), Text("Tăng")],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

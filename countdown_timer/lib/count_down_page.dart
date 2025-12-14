import 'dart:async';

import 'package:flutter/material.dart';

class CountDownPage extends StatefulWidget {
  const CountDownPage({super.key});

  @override
  State<CountDownPage> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {
  late int sec;
  late TextEditingController controller;
  Timer? timer;

  @override
  void initState() {
    sec = 0;
    controller = TextEditingController();
    timer = null;
    super.initState();
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("⌛ Bộ đếm thời gian"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nhập số giây cần đếm:'),
          SizedBox(height: 20),
          TextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
            ),
          ),
          SizedBox(height: 30),
          renderTime(sec),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  if (timer != null) {
                    timer!.cancel();
                  }
                  setState(() {
                    sec = int.parse(controller.text);
                  });
                  timer = Timer.periodic(Duration(seconds: 1), (timer) {
                    if (sec > 0) {
                      setState(() {
                        sec = sec - 1;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('⏰ Hết thời gian!')),
                      );
                      timer.cancel();
                    }
                  });
                },
                label: Text('Bắt đầu'),
                icon: Icon(Icons.play_arrow),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    sec = 0;
                  });
                  if (timer != null) {
                    timer!.cancel();
                  }
                  controller.clear();
                },
                label: Text('Đặt lại'),
                icon: Icon(Icons.refresh),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderTime(int sec) {
    int minutePart = sec ~/ 60;
    int secPart = (sec % 60);
    return Text(
      minutePart.toString().padLeft(2, '0') +
          ':' +
          secPart.toString().padLeft(2, '0'),
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }
}

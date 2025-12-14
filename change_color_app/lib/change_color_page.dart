import 'dart:math';

import 'package:flutter/material.dart';

class ChangeColorPage extends StatefulWidget {
  const ChangeColorPage({super.key});

  @override
  State<ChangeColorPage> createState() => _ChangeColorPageState();
}

class _ChangeColorPageState extends State<ChangeColorPage> {
  late List<Color> colors;
  late List<String> colorNames;
  late int currentColor;

  @override
  void initState() {
    colors = [
      Colors.red,
      Colors.pink,
      Colors.green,
      Colors.purple,
      Colors.blue,
    ];
    colorNames = ['Red', 'Pink', 'Green', 'Purple', 'Blue'];
    currentColor = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Color App'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      decoration: BoxDecoration(color: colors[currentColor]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            "Current color is : ${colorNames[currentColor]}",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    Random random = Random();
                    currentColor = random.nextInt(colors.length);
                  });
                },
                icon: Icon(Icons.color_lens),
                label: Text('Change color'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: colors[currentColor],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    currentColor = 0;
                  });
                },
                icon: Icon(Icons.replay),
                label: Text('Reset'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: colors[currentColor],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

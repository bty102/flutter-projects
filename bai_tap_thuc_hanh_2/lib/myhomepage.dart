import 'dart:math';

import 'package:bai_tap_thuc_hanh_2/MyClass.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: myBody()));
  }
}

Widget myBody() {
  return ListView(scrollDirection: Axis.vertical, children: buildBlocks());
}

Widget block(String className, String classId, int studentQuantity, Color cl) {
  return Container(
    height: 100.0,
    margin: EdgeInsets.only(left: 4, right: 4, bottom: 5),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(5),
      color: cl,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  className,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  classId,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Text(
              studentQuantity.toString() + " học viên",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // IconButton(
            //   onPressed: () {
            //     print("wtf is this???");
            //   },
            //   icon: Icon(Icons.more_horiz),
            // ),
            PopupMenuButton(
              icon: Icon(Icons.more_horiz, color: Colors.white),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(child: Text("Di chuyển")),

                  PopupMenuItem(child: Text("Hủy đăng ký")),
                ];
              },
            ),
          ],
        ),
      ],
    ),
  );
}

List<MyClass> getMyclasses() {
  List<MyClass> classes = [];
  classes.add(
    MyClass(
      "2025-2026.1.TIN4403.001",
      "Lập trình ứng dụng cho các thiết bị di động - Nhóm 1",
      60,
    ),
  );
  classes.add(
    MyClass(
      "2024-2025.1.TIN4663.006",
      "[2024-2025.1] - Trí tuệ nhân tạo - Nhóm 6",
      50,
    ),
  );
  classes.add(
    MyClass(
      "2023-2024.2.TIN3084.001",
      "Cấu trúc dữ liệu và thuật toán - Nhóm 1",
      55,
    ),
  );
  classes.add(
    MyClass(
      "2023-2024.1.TIN3073.008",
      "[2023-2024.1] - Lập trình hướng đối tượng - Nhóm 8",
      59,
    ),
  );
  classes.add(
    MyClass("2022-2023.1.TOA1012 - ANN", "[2022-2023.1] - Cơ sở toán", 70),
  );
  classes.add(MyClass("2204", "Toán cao cấp", 50));
  classes.add(MyClass("6789", "Hóa học cơ bản", 70));
  classes.add(MyClass("6969", "What the fuck is this", 89));
  return classes;
}

List<Widget> buildBlocks() {
  List<Widget> blocks = [];
  List<Color> colors = [
    Colors.pink,
    Colors.amber,
    Colors.tealAccent,
    Colors.purpleAccent,
    Colors.limeAccent,
  ];
  List<MyClass> classes = getMyclasses();
  for (MyClass cls in classes) {
    Color color = colors[Random().nextInt(colors.length)];
    blocks.add(block(cls.getName, cls.getId, cls.getNumberOfStudent, color));
  }
  return blocks;
}

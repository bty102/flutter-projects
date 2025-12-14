import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }
}

Widget myBody() {
  return Column(children: [block1(), block2(), block3(), block4()]);
}

Widget block1() {
  // return Image.asset('assets/images/tai_anh_phong_canh_dep_thump.jpg');
  String imgUrl =
      "https://cdn.pixabay.com/photo/2023/05/23/02/12/girl-8011732_1280.jpg";
  return Image.network(imgUrl);
}

Widget block2() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Oeschinen Lake Campground",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Kandersteg, Switzerland",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.yellow),
            Text("41"),
          ],
        ),
      ],
    ),
  );
}

Widget block3() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(Icons.call, color: Colors.blue),
          Text("CALL", style: TextStyle(color: Colors.blue)),
        ],
      ),
      Column(
        children: [
          Icon(Icons.route, color: Colors.blue),
          Text("ROUTE", style: TextStyle(color: Colors.blue)),
        ],
      ),
      Column(
        children: [
          Icon(Icons.share, color: Colors.blue),
          Text("SHARE", style: TextStyle(color: Colors.blue)),
        ],
      ),
    ],
  );
}

Widget block4() {
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Text(
      "Oeschinensee is accessible by foot from Kandersteg within 1.5 hours. The cable car operates in summer and winter season daily from mornings till evenings - non stop. In summer enjoy swimming in the lake, boat rides on the blue and clear water or just have fun with the toboggan run at the top station of the cable car. Several hotels around the lake offer rooms in summer. Restaurants are open in winter and summer. The region belongs to the Unesco heritage Jungfrau-Aletsch.",
    ),
  );
}

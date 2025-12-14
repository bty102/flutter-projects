import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }
}

Widget myBody() {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        block1(),
        SizedBox(height: 30),
        block2(),
        SizedBox(height: 20),
        block3(),
        SizedBox(height: 50),
        SizedBox(
          child: Text(
            "Saved Places",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        block4(),
      ],
    ),
  );
}

Widget buildPlace(String img) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill),
    ),
  );
}

Widget block1() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
      IconButton(onPressed: () {}, icon: Icon(Icons.extension)),
    ],
  );
}

Widget block2() {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "Welcome,\n",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
        ),
        TextSpan(
          text: "Charlie",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 50),
        ),
      ],
    ),
  );
}

Widget block3() {
  return TextField(
    cursorColor: Colors.lightBlueAccent,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.search, color: Colors.lightBlueAccent),
      hintText: "Search",
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );
}

Widget block4() {
  return Expanded(
    child: GridView.count(
      crossAxisCount: 2, // so cot
      crossAxisSpacing: 10, // khoang cach cot
      mainAxisSpacing: 10, // khoang cach hang
      children: [
        // Container(
        //   child: Image.asset("images/cau_trang_tien.jpg", fit: BoxFit.fill),
        // ),
        // Container(
        //   child: Image.asset("images/chua_thien_mu.jpg", fit: BoxFit.fill),
        // ),
        // Container(
        //   child: Image.asset("images/doi_vong_canh.jpg", fit: BoxFit.fill),
        // ),
        // Container(
        //   child: Image.asset("images/ho_khe_ngang.jpg", fit: BoxFit.fill),
        // ),
        buildPlace("images/cau_trang_tien.jpg"),
        buildPlace("images/chua_thien_mu.jpg"),
        buildPlace("images/doi_vong_canh.jpg"),
        buildPlace("images/ho_khe_ngang.jpg"),
      ],
    ),
  );
}

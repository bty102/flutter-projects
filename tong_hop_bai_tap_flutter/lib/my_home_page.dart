import 'package:flutter/material.dart';

import 'package:bai_tap_thuc_hanh_1/myhomepage.dart' as btth1;
import 'package:bai_tap_thuc_hanh_2/myhomepage.dart' as btth2;
import 'package:dach_sach_dia_diem_don_gian/myhomepage.dart' as dsdddg;
import 'package:danh_sach_dia_diem_phuc_tap/myhomepage.dart' as dsddpt;
import 'package:stf_bai_thuc_hanh_1/counter_app.dart' as stfbth1;
import 'package:change_color_app/change_color_page.dart' as cca;
import 'package:countdown_timer/count_down_page.dart' as cdt;
import 'package:login_form/login_form.dart' as lgf;
import 'package:form_dang_ky/registration_page.dart' as fdk;
import 'package:news_app/news_page.dart' as na;
import 'package:danh_sach_san_pham_webapi/products_page.dart' as dsspwapi;
import 'package:auth_app/login_page.dart' as authapp;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tổng hợp bài tập flutter'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '🧑‍💻 Phạm Ngọc Mộng Phước',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(child: Text('🪪 22T1020329', style: TextStyle(fontSize: 20))),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Center(child: Text("📚 Danh sách bài tập")),
              decoration: BoxDecoration(color: Colors.lightBlueAccent),
            ),
            ListTile(
              title: Text('Bài 1. Bài tập thực hành 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => btth1.MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text('Bài 2. Bài tập thực hành 2'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => btth2.MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text('Bài 3. Danh sách địa điểm đơn giản'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dsdddg.MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text('Bài 4. Danh sách địa điểm phức tạp'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dsddpt.MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text('Bài 5. STF bài thực hành 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => stfbth1.CounterApp()),
                );
              },
            ),
            ListTile(
              title: Text('Bài 6. Change color app'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => cca.ChangeColorPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Bài 7. Countdown timer'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cdt.CountDownPage()),
                );
              },
            ),
            ListTile(
              title: Text('Bài 8. Login form'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => lgf.LoginForm()),
                );
              },
            ),
            ListTile(
              title: Text('Bài 9. Form đăng ký'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => fdk.RegistrationPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Bài 10. NEWS app'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => na.NewsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Bài 11. Danh sách sản phẩm WebAPI'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => dsspwapi.ProductsPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Bài 12. Auth app'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => authapp.LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

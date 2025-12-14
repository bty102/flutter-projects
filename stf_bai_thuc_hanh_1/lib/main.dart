import 'package:flutter/material.dart';
import 'package:stf_bai_thuc_hanh_1/counter_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterApp());
  }
}

import 'package:auth_app/api.dart';
import 'package:auth_app/model/token.dart';
import 'package:auth_app/user_details_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;

  final _formKey = GlobalKey<FormState>();

  late bool hidePass;

  @override
  void initState() {
    username = null;
    password = null;
    hidePass = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              // initialValue: username,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tài khoản không được để trống';
                }
                return null;
              },
              onChanged: (value) {
                username = value;
                // print(username);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                label: Text(
                  'Username',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextFormField(
              // initialValue: password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Mật khẩu không được để trống';
                }
                return null;
              },
              onChanged: (value) {
                password = value;
                // print(password);
              },
              obscureText: hidePass,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                label: Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePass = !hidePass;
                    });
                  },
                  icon: (hidePass)
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid
                  print("Username: ${username}, password: ${password}");

                  Api api = Api();
                  Token? token = await api.login(username!, password!);
                  if (token == null) {
                    print('Login that bai!');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Đăng nhập thất bại')),
                    );
                  } else {
                    print('Login thanh cong');
                    print(token.accessToken);
                    username = null;
                    password = null;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailsPage(token: token),
                      ),
                    );
                  }
                }
              },
              child: Icon(Icons.login, fontWeight: FontWeight.bold),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

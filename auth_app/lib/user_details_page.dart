import 'package:auth_app/api.dart';
import 'package:auth_app/login_page.dart';
import 'package:auth_app/model/token.dart';
import 'package:auth_app/model/user.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  Token token;
  UserDetailsPage({super.key, required this.token});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late Future<User?> user;

  @override
  void initState() {
    Api api = Api();
    user = api.getCurrentAuthUser(widget.token.accessToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Api api = Api();
                setState(() {
                  user = api.getCurrentAuthUser(widget.token.accessToken);
                });
              },
              icon: Icon(Icons.person),
            ),
            Text(
              'User ddetails',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return FutureBuilder(
      future: user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            });
            return Text('Chuyển hướng sang trang login...');
          } else {
            return renderUser(snapshot.data!);
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget renderUser(User user) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: ListView(
        scrollDirection: Axis.vertical,

        children: [
          Column(
            children: [
              Image.network(user.imageUrl, height: 300),
              Text("Email: ${user.email}"),
              Text("Phone: ${user.phone}"),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(
              // color: const Color.fromARGB(255, 246, 221, 230),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1)),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "More:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Text("First name: ${user.firstName}"),
                Text("Last name: ${user.lastName}"),
                Text("Age: ${user.age}"),
                Text("Gender: ${user.gender}"),
                Text("Birth day: ${user.birthDate}"),
                Text("Blood group: ${user.bloodGroup}"),
                Text("Height: ${user.height}"),
                Text("Weight: ${user.weight}"),
                Text("Eye color: ${user.eyeColor}"),
                Text("University: ${user.university}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

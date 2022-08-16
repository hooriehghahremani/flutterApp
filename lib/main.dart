import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_app/hive/Boxes.dart';
import 'package:sample_app/models/User.dart';
import 'package:sample_app/pages/InfoPage.dart';
import 'package:sample_app/pages/SignupPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>("users");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SignupPage());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: Colors.indigoAccent, //background color of app bar
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 200,
              width: 400,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueAccent)),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: usernameTextController,
                    decoration: const InputDecoration(
                        hintText: "Username",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: 300,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                        // color: Colors.white60,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blueAccent)),
                    child: TextField(
                      style: const TextStyle(fontSize: 20),
                      controller: passwordTextController,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent))),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 310,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    // color: Colors.white60,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                      style: (ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      )),
                      onPressed: () {
                        var user = findUserInDB(usernameTextController.text,
                            passwordTextController.text);
                        if (user == null) {
                          print("User not found");
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InfoPage(user: user)));
                        }
                      },
                      child: const Text("click")),
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  User? findUserInDB(String username, String password) {
    var box = Boxes.getUsers();
    for (var element in box.values) {
      if (element.username == username && element.password == password) {
        return element;
      }
    }
    return null;
  }
}

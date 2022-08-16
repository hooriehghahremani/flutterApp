import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sample_app/hive/Boxes.dart';
import 'package:sample_app/models/User.dart';

import '../main.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameTextController = TextEditingController();
    TextEditingController lastNameTextController = TextEditingController();
    TextEditingController usernameTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    TextEditingController ageTextController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup Page"),
        backgroundColor: Colors.indigo,
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
                    controller: firstNameTextController,
                    decoration: const InputDecoration(
                        hintText: "first name",
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
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueAccent)),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: lastNameTextController,
                    decoration: const InputDecoration(
                        hintText: "last name",
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
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueAccent)),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: ageTextController,
                    decoration: const InputDecoration(
                        hintText: "age",
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
                      obscureText: true,
                      style: const TextStyle(fontSize: 20),
                      controller: passwordTextController,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent))),
                    )),
                const SizedBox(
                  height: 30,
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
                        // save user in db
                        saveUserInDB(
                            firstNameTextController.text,
                            lastNameTextController.text,
                            int.parse(ageTextController.text),
                            usernameTextController.text,
                            passwordTextController.text);
                        // go to sign in page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      },
                      child: const Text("click")),
                ),
                const SizedBox(
                  height: 50,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      },
                      child: const Text("SignIn")),
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  void saveUserInDB(String firstName, String lastName, int age, String username,
      String password) async {
    User user = User(
        firstName: firstName,
        lastName: lastName,
        age: age,
        username: username,
        password: password);
    final box = Boxes.getUsers();
    box.add(user);
  }
}

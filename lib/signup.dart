import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sample_app/Boxes.dart';
import 'package:sample_app/main.dart';
import 'package:sample_app/user_info_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController mailcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Register Page"),
            backgroundColor: Colors.indigoAccent),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    width: 300,
                    height: 200,
                  ),
                  Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            style: const TextStyle(fontSize: 20),
                            controller: namecontroller,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: "Username",
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                          TextField(
                            style: TextStyle(fontSize: 20),
                            controller: passcontroller,
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: "Password",
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                          TextField(
                            style: const TextStyle(fontSize: 20),
                            controller: mailcontroller,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.mail),
                                hintText: "Email",
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                _saveData();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              },
                              child: const Text("Sign Up"))
                        ],
                      )),
                ],
              ),
            )));
  }

  Future<void> _saveData() async {
    String username = namecontroller.text;
    String password = passcontroller.text;
    String mail = mailcontroller.text;

    var user = UserInfo(username: username, password: password, mail: mail);
    var box = Boxes.getUserInfo();
    box.add(user);
  }
}

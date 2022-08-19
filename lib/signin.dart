import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sample_app/main.dart';
import 'package:sample_app/user_info_model.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController mailcontroller = TextEditingController();
  late final UserInfo user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Login Page"),
        backgroundColor: Colors.indigoAccent, //background color of app bar
      ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 7 , vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent)
                      ),
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:   [
                          Text("${user.username} ${user.mail}")

                ],
                      )
              ),
  ]
            )
        )
    )
    );
  }

}

import 'package:flutter/material.dart';
import 'package:sample_app/models/User.dart';

class InfoPage extends StatelessWidget {
  final User user;

  const InfoPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${user.firstName} ${user.lastName}"),
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
                    child: Text("${user.firstName} ${user.lastName}")),
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
                  child: Text("${user.age}"),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}

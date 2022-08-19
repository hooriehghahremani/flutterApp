import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sample_app/signup.dart';
import 'package:sample_app/signin.dart';
import 'package:sample_app/user_info_model.dart';



late Box box;
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   box = await Hive.openBox('Box');
   Hive.registerAdapter(UserInfoAdapter());
  runApp(  const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController passcontroller = TextEditingController();
    final TextEditingController mailcontroller = TextEditingController();
    const snack = SnackBar(content: Text("User Not Found"),
        backgroundColor: Colors.deepOrange
    );
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
                  height: 200,
                  width: 400,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(horizontal: 7 , vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent)
                      ),
                      child: TextField(
                        style: const TextStyle(
                            fontSize: 20
                        ),
                        controller: namecontroller ,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "Username",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent
                                )
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                        width: 300,
                        padding: const EdgeInsets.symmetric(horizontal: 7 , vertical: 3),
                        decoration: BoxDecoration(
                          // color: Colors.white60,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        child: TextField(
                          style: const TextStyle(
                              fontSize: 20
                          ),
                          controller: passcontroller ,
                          obscureText: true,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.lock),
                              hintText: "Password" ,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  )
                              )
                          ),
                        )
                    ),
                    const SizedBox(height: 30,),
                    Container(
                      width: 310,

                      padding: const EdgeInsets.symmetric(horizontal: 7 , vertical: 3),
                      decoration: BoxDecoration(
                        // color: Colors.white60,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: ElevatedButton(

                          style: (ElevatedButton.styleFrom(
                            primary: Colors.indigo ,
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle:  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),

                          )
                          ),
                          onPressed: () async {
                            var box = await Hive.openBox('UserInfo');
                            UserInfo user = box.get('user');

                            namecontroller.text = user.username!;
                            passcontroller.text = user.password as String ;
                            mailcontroller.text = user.mail;
                            // box.close();

                            Text("${user.username} ${user.mail}");
                            //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));



                          } ,
                          child: const Text("Sign In")),
                    ),
                    Container(
                      width: 310,

                      padding: const EdgeInsets.symmetric(horizontal: 7 , vertical: 3),
                      decoration: BoxDecoration(
                        // color: Colors.white60,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: ElevatedButton(

                          style: (ElevatedButton.styleFrom(
                            primary: Colors.indigo ,
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle:  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),

                          )
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                          } ,
                          child: const Text("Sign Up")),
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}
















import 'package:flutter/material.dart';

void main() {
  runApp( const MyAPP());
}
class MyApp  extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textcontroller = TextEditingController();
    TextEditingController _passcontroller = TextEditingController();
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
                    padding: EdgeInsets.symmetric(horizontal: 7 , vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 20
                      ),
                      controller: _textcontroller ,
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
                      padding: EdgeInsets.symmetric(horizontal: 7 , vertical: 3),
                      decoration: BoxDecoration(
                        // color: Colors.white60,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent)
                      ),
                      child: TextField(
                        style: const TextStyle(
                            fontSize: 20
                        ),
                        controller: _passcontroller ,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                            prefixText: "pass:  ",
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

                    padding: EdgeInsets.symmetric(horizontal: 7 , vertical: 3),
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
                          print("User: ${_textcontroller.text}");
                          print("Pass: ${_passcontroller.text}");
                        } ,
                        child: const Text("Login")),
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

class MyAPP extends StatefulWidget {
  const MyAPP({Key? key}) : super(key: key);

  @override
  State<MyAPP> createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp2()
    );
  }
}


class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const Text("Count" , style: TextStyle(fontSize: 50),),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: (){},
                child: const Text("+" , style: TextStyle(fontSize: 50),))
          ],
        ),
      ),
    );
  }
}









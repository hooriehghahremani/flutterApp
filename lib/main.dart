import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
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
                        controller: _textcontroller ,
                        decoration: const InputDecoration(
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
                          print("Text: ${_textcontroller.text}");
                        } ,
                        child: const Text("click")),
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







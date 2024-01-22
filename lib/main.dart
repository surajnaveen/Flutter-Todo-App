import 'package:app_two/todo.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        //enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController psw = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 80),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "User Name or Email",
                      ),
                      controller: email,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:  TextField(
                      decoration: const InputDecoration(
                        hintText: "Password",
                      ),
                      obscureText: true,
                      controller: psw,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          print(email.text);
                          print(psw.text);
          
                          if(email.text == "" && psw.text == ""){
                              print("yes");
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  todoPage()),
                              );
                          }
                          else{
                            print("Error");
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 40),
                        )),
                  )
                ],
              ),
            )),
          );
        }
      ),
    );
  }
}
